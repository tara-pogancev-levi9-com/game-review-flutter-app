import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/blocs/review_cubit.dart';
import 'package:game_review/common/blocs/review_state.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_fonts.dart';
import 'package:game_review/common/theme/border_size.dart';
import 'package:game_review/common/widgets/loading_button.dart';
import 'package:game_review/features/auth/bloc/auth_cubit.dart';
import 'package:game_review/features/auth/bloc/auth_state.dart';
import 'package:game_review/features/profile_screen/services/user_service.dart';
import 'package:game_review/i18n/strings.g.dart';

class AddReviewPage extends StatefulWidget {
  final GameModel game;

  const AddReviewPage({
    super.key,
    required this.game,
  });

  @override
  State<AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  late final ReviewsCubit _reviewsCubit;
  late final AuthCubit _authCubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers for required fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Required state
  bool _recommended = true;
  double _overallRating = 3.0;

  @override
  void initState() {
    super.initState();
    _reviewsCubit = locator<ReviewsCubit>();
    _authCubit = locator<AuthCubit>();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _onSave() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      final userService = locator<UserService>();
      final userId = await userService.getCurrentUserUid();

      await _reviewsCubit.addReview(
        user_id: userId,
        game_id: widget.game.id,
        title: _titleController.text.trim(),
        content: _descriptionController.text.trim(),
        overall_rating: _overallRating,
        recommended: _recommended,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final topInset = MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        leading: const BackButton(color: Colors.white),
        title: Text(
          t.back,
          style: const TextStyle(
            fontFamily: AppFonts.josefinSans,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: Theme.of(context).extension<AppGradients>()?.background,
        ),
        child: BlocConsumer<ReviewsCubit, ReviewState>(
          bloc: _reviewsCubit,
          listener: (context, state) {
            state.maybeWhen(
              reviewAdded: (review) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Review added successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
                // Go back and trigger refresh
                Navigator.of(
                  context,
                ).pop(true); // Return true to indicate success
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  24,
                  topInset + kToolbarHeight + 16,
                  24,
                  24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Game Header with Cover Image
                    _buildGameHeader(),
                    const SizedBox(height: 32),

                    // Game Title
                    Text(
                      widget.game.title,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 24),

                    // Overall Section with Recommendation Toggle (REQUIRED)
                    _buildOverallSection(),
                    const SizedBox(height: 24),

                    // Title Input (REQUIRED)
                    TextFormField(
                      controller: _titleController,
                      maxLines: 1,
                      style: const TextStyle(color: AppColors.textPrimary),
                      decoration: InputDecoration(
                        hintText: 'Review title *',
                        hintStyle: const TextStyle(
                          color: AppColors.textSecondary,
                        ),
                        filled: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderSize.m.radius,
                          borderSide: const BorderSide(
                            color: AppColors.outline,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderSize.m.radius,
                          borderSide: const BorderSide(
                            color: AppColors.outline,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderSize.m.radius,
                          borderSide: const BorderSide(
                            color: AppColors.lilacSelected,
                            width: 1.8,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderSize.m.radius,
                          borderSide: const BorderSide(
                            color: Colors.redAccent,
                            width: 1,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderSize.m.radius,
                          borderSide: const BorderSide(
                            color: Colors.redAccent,
                            width: 1.8,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Review title is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Description Input (REQUIRED)
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 5,
                      style: const TextStyle(color: AppColors.textPrimary),
                      decoration: InputDecoration(
                        hintText: 'Review description *',
                        hintStyle: const TextStyle(
                          color: AppColors.textSecondary,
                        ),
                        filled: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderSize.m.radius,
                          borderSide: const BorderSide(
                            color: AppColors.outline,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderSize.m.radius,
                          borderSide: const BorderSide(
                            color: AppColors.outline,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderSize.m.radius,
                          borderSide: const BorderSide(
                            color: AppColors.lilacSelected,
                            width: 1.8,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderSize.m.radius,
                          borderSide: const BorderSide(
                            color: Colors.redAccent,
                            width: 1,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderSize.m.radius,
                          borderSide: const BorderSide(
                            color: Colors.redAccent,
                            width: 1.8,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Review description is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),

                    // Overall Rating (REQUIRED)
                    _buildOverallRating(),
                    const SizedBox(height: 32),

                    // Save Button
                    Center(
                      child: LoadingButton(
                        isLoading: isLoading,
                        onPressed: _onSave,
                        text: 'Save',
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGameHeader() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderSize.m.radius,
        child: Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant,
            borderRadius: BorderSize.m.radius,
          ),
          child: widget.game.coverImageUrl != null
              ? Image.network(
                  widget.game.coverImageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _placeholder(),
                )
              : _placeholder(),
        ),
      ),
    );
  }

  Widget _placeholder() => const Center(
    child: Icon(
      Icons.gamepad_rounded,
      size: 64,
      color: AppColors.textSecondary,
    ),
  );

  Widget _buildOverallSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overall',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'I recommend this game *',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
            Switch(
              value: _recommended,
              onChanged: (value) => setState(() => _recommended = value),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOverallRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overall Rating *',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () =>
                  setState(() => _overallRating = (index + 1).toDouble()),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  index < _overallRating ? Icons.star : Icons.star_border,
                  color: index < _overallRating
                      ? AppColors.primaryPurple
                      : AppColors.textSecondary,
                  size: 40,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
