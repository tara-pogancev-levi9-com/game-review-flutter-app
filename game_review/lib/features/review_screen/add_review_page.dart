import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/blocs/review_form_cubit.dart';
import 'package:game_review/common/blocs/review_form_state.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/services/reviews_service.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_fonts.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/common/widgets/app_snackbar.dart';
import 'package:game_review/common/widgets/loading_button.dart';
import 'package:game_review/features/profile_screen/services/user_service.dart';
import 'package:game_review/features/review_screen/widgets/custom_text_form_field.dart';
import 'package:game_review/features/review_screen/widgets/game_header_widget.dart';
import 'package:game_review/features/review_screen/widgets/overall_section_widget.dart';
import 'package:game_review/features/review_screen/widgets/rating_row_widget.dart';
import 'package:game_review/features/review_screen/widgets/rating_section_widget.dart';
import 'package:game_review/features/review_screen/widgets/review_dropdown.dart';
import 'package:game_review/features/review_screen/widgets/section_title_widget.dart';
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
  late final ReviewFormCubit _reviewFormCubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers for required fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _propsController = TextEditingController();
  final TextEditingController _consController = TextEditingController();
  final TextEditingController _playtimeController = TextEditingController();

  // Form field keys for validation
  final GlobalKey<FormFieldState> _titleKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _descriptionKey = GlobalKey<FormFieldState>();

  // Required state
  bool _recommended = true;
  double _overallRating = 3.0;
  double _gameplayRating = 3.0;
  double _graphicsRating = 3.0;
  double _storyRating = 3.0;
  double _soundRating = 3.0;
  double _valueRating = 3.0;

  // Optional state
  double _completionPercentage = 50.0;
  String _completionStatus = t.inProgress;

  bool firstInput = true;

  @override
  void initState() {
    super.initState();
    _reviewFormCubit = locator<ReviewFormCubit>();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _propsController.dispose();
    _consController.dispose();
    _playtimeController.dispose();
    super.dispose();
  }

  Future<void> _onSave() async {
    if (!_formKey.currentState!.validate()) {
      setState(() => firstInput = false);
      // Scroll to first error field
      Future.delayed(const Duration(milliseconds: 300), () {
        Scrollable.ensureVisible(
          _titleKey.currentContext ?? _descriptionKey.currentContext!,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
      return;
    }

    try {
      final userService = locator<UserService>();
      final userId = await userService.getCurrentUserUid();
      final reviewsService = locator<ReviewsService>();

      final hasReview = await reviewsService.hasUserReviewedGame(
        userId: userId,
        gameId: widget.game.id,
      );

      if (hasReview) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t.youHaveAlreadyReviewedThisGame),
              backgroundColor: Colors.orange,
            ),
          );
        }
        return;
      }

      final pros = _propsController.text.isNotEmpty
          ? _propsController.text.split(',').map((e) => e.trim()).toList()
          : null;

      final cons = _consController.text.isNotEmpty
          ? _consController.text.split(',').map((e) => e.trim()).toList()
          : null;

      final playtimeHours = _playtimeController.text.isNotEmpty
          ? int.tryParse(_playtimeController.text)
          : null;

      String formattedCompletionStatus = _completionStatus;
      if (_completionStatus == t.completed) {
        formattedCompletionStatus = 'Completed (100%)';
      } else if (_completionStatus == t.notStarted) {
        formattedCompletionStatus = 'Not Started (0%)';
      } else if (_completionStatus == t.inProgress) {
        formattedCompletionStatus =
            'In Progress (${_completionPercentage.toInt()}%)';
      } else if (_completionStatus == t.abandoned) {
        formattedCompletionStatus =
            'Abandoned (${_completionPercentage.toInt()}%)';
      }

      double clampRating(double value) => (value * 2).clamp(0.0, 9.9);

      await _reviewFormCubit.addReview(
        user_id: userId,
        game_id: widget.game.id,
        title: _titleController.text.trim(),
        content: _descriptionController.text.trim(),
        overall_rating: clampRating(_overallRating),
        recommended: _recommended,
        gameplay_rating: clampRating(_gameplayRating),
        graphics_rating: clampRating(_graphicsRating),
        story_rating: clampRating(_storyRating),
        sound_rating: clampRating(_soundRating),
        value_rating: clampRating(_valueRating),
        pros: pros,
        cons: cons,
        playtime_hours: playtimeHours,
        completion_status: formattedCompletionStatus,
      );
    } catch (e) {
      AppSnackbar.showError(context, t.failedToSaveReview, error: e);
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
        child: BlocConsumer<ReviewFormCubit, ReviewFormState>(
          bloc: _reviewFormCubit,
          listener: (context, state) {
            state.maybeWhen(
              success: (review) {
                AppSnackbar.showSuccess(context, t.reviewAddedSuccessfully);

                Navigator.of(context).pop(true);
              },
              error: (message) {
                AppSnackbar.showError(
                  context,
                  t.failedToSaveReview,
                  error: message,
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
              autovalidateMode: !firstInput
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
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
                    GameHeaderWidget(game: widget.game),
                    const SizedBox(height: 32),

                    // Game Title
                    Text(
                      widget.game.title,
                      style: AppTypography.gameTitle28,
                    ),
                    const SizedBox(height: 24),

                    // Overall Section with Recommendation Toggle (REQUIRED)
                    OverallSectionWidget(
                      recommended: _recommended,
                      onChanged: (value) =>
                          setState(() => _recommended = value),
                    ),
                    const SizedBox(height: 24),

                    // Title Input (REQUIRED)
                    CustomTextFormField(
                      key: _titleKey,
                      controller: _titleController,
                      label: t.reviewTitle,
                      maxLines: 1,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return t.reviewTitleIsRequired;
                        }
                        return null;
                      },
                      firstInput: firstInput,
                    ),
                    const SizedBox(height: 16),

                    // Description Input (REQUIRED)
                    CustomTextFormField(
                      key: _descriptionKey,
                      controller: _descriptionController,
                      label: t.reviewDescription,
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return t.reviewDescriptionIsRequired;
                        }
                        return null;
                      },
                      firstInput: firstInput,
                    ),
                    const SizedBox(height: 32),

                    // Pros & Cons Section (OPTIONAL)
                    SectionTitleWidget(title: t.prosCons),
                    const SizedBox(height: 16),

                    CustomTextFormField(
                      controller: _propsController,
                      label: t.gamePros,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 16),

                    CustomTextFormField(
                      controller: _consController,
                      label: t.gameCons,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 32),

                    // Overall Rating (REQUIRED)
                    RatingSectionWidget(
                      title: t.overallRating,
                      rating: _overallRating,
                      onChanged: (value) =>
                          setState(() => _overallRating = value),
                    ),
                    const SizedBox(height: 32),

                    // Other Ratings (OPTIONAL)
                    SectionTitleWidget(title: t.individualRatings),
                    const SizedBox(height: 16),

                    RatingRowWidget(
                      label: t.gameplay,
                      rating: _gameplayRating,
                      onChanged: (value) =>
                          setState(() => _gameplayRating = value),
                    ),
                    const SizedBox(height: 12),

                    RatingRowWidget(
                      label: t.graphics,
                      rating: _graphicsRating,
                      onChanged: (value) =>
                          setState(() => _graphicsRating = value),
                    ),
                    const SizedBox(height: 12),

                    RatingRowWidget(
                      label: t.story,
                      rating: _storyRating,
                      onChanged: (value) =>
                          setState(() => _storyRating = value),
                    ),
                    const SizedBox(height: 12),

                    RatingRowWidget(
                      label: t.sound,
                      rating: _soundRating,
                      onChanged: (value) =>
                          setState(() => _soundRating = value),
                    ),
                    const SizedBox(height: 12),

                    RatingRowWidget(
                      label: t.value,
                      rating: _valueRating,
                      onChanged: (value) =>
                          setState(() => _valueRating = value),
                    ),
                    const SizedBox(height: 32),

                    // Misc Section (OPTIONAL)
                    SectionTitleWidget(title: t.miscellaneous),
                    const SizedBox(height: 16),

                    // Completion Percentage Slider
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              t.gameCompletion,
                              style: AppTypography.labelSmall,
                            ),
                            Text(
                              '${_completionPercentage.toInt()}%',
                              style: AppTypography.smallText,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Slider(
                          value: _completionPercentage,
                          min: 0,
                          max: 100,
                          divisions: 100,
                          onChanged: (value) =>
                              setState(() => _completionPercentage = value),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Completion Status Dropdown
                    ReviewDropdown(
                      label: t.completionStatus,
                      value: _completionStatus,
                      items: [
                        t.notStarted,
                        t.inProgress,
                        t.completed,
                        t.abandoned,
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _completionStatus = value;

                            // Auto-fill completion percentage based on status
                            if (value == t.completed) {
                              _completionPercentage = 100.0;
                            } else if (value == t.notStarted) {
                              _completionPercentage = 0.0;
                            }
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 24),

                    // In-game Hours Input (OPTIONAL)
                    CustomTextFormField(
                      controller: _playtimeController,
                      label: t.inGameHours,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          if (int.tryParse(value) == null) {
                            return t.pleaseEnterAValidNumber;
                          }
                        }
                        return null;
                      },
                      firstInput: firstInput,
                    ),
                    const SizedBox(height: 32),

                    // Save Button
                    Center(
                      child: LoadingButton(
                        isLoading: isLoading,
                        onPressed: _onSave,
                        text: t.save,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
