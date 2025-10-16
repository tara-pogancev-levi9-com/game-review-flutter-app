import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/blocs/review_form_cubit.dart';
import 'package:game_review/common/blocs/review_form_state.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/services/reviews_service.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/common/widgets/app_snackbar.dart';
import 'package:game_review/common/widgets/loading_button.dart';
import 'package:game_review/features/main_screen/widgets/header_widget.dart';
import 'package:game_review/features/profile_screen/services/user_service.dart';
import 'package:game_review/features/review_screen/widgets/custom_text_form_field.dart';
import 'package:game_review/features/review_screen/widgets/game_header_widget.dart';
import 'package:game_review/features/review_screen/widgets/overall_section_widget.dart';
import 'package:game_review/features/review_screen/widgets/rating_row_widget.dart';
import 'package:game_review/features/review_screen/widgets/rating_section_widget.dart';
import 'package:game_review/features/review_screen/widgets/review_dropdown.dart';
import 'package:game_review/features/review_screen/widgets/section_title_widget.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/theme/app_styles.dart';

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
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _selectedImages;

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

  Future<void> _pickMultiImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null && images.isNotEmpty) {
      setState(() {
        if (_selectedImages != null) {
          _selectedImages!.addAll(images);
        } else {
          _selectedImages = images;
        }
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages!.removeAt(
        index,
      );
    });
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
              backgroundColor: AppColors.warning,
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

      final response = await _reviewFormCubit.addReview(
        userId: userId,
        gameId: widget.game.id,
        title: _titleController.text.trim(),
        content: _descriptionController.text.trim(),
        overallRating: clampRating(_overallRating),
        recommended: _recommended,
        gameplayRating: clampRating(_gameplayRating),
        graphicsRating: clampRating(_graphicsRating),
        storyRating: clampRating(_storyRating),
        soundRating: clampRating(_soundRating),
        valueRating: clampRating(_valueRating),
        pros: pros,
        cons: cons,
        playtimeHours: playtimeHours,
        completionStatus: formattedCompletionStatus,
      );
      if (response != null &&
          _selectedImages != null &&
          _selectedImages!.isNotEmpty) {
        await _reviewFormCubit.addReviewImages(response.id, _selectedImages!);
      }
    } catch (e) {
      AppSnackbar.showError(context, t.failedToSaveReview, error: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: Theme.of(context).extension<AppGradients>()?.background,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomHeader(
          isHome: false,
          onBack: () => Navigator.pop(context),
        ),
        body: BlocConsumer<ReviewFormCubit, ReviewFormState>(
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
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Game Header with Cover Image
                    GameHeaderWidget(game: widget.game),
                    const SizedBox(height: 32),

                    // Game Title
                    Text(
                      widget.game.title,
                      style: AppTypography.heading,
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
                          activeColor: AppColors.lilacSelected,
                          inactiveColor: AppColors.textTertiary,
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
                    SectionTitleWidget(title: t.addImages),
                    (_selectedImages != null && _selectedImages!.isNotEmpty)
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: AppColors.softWhite),
                            ),
                            child: SizedBox(
                              height: 300,
                              child: GridView.builder(
                                padding: const EdgeInsets.all(8),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 18,
                                      mainAxisSpacing: 18,
                                      childAspectRatio: 1,
                                    ),
                                itemCount: _selectedImages!.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.file(
                                          File(_selectedImages![index].path),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 6,
                                        right: 6,
                                        child: GestureDetector(
                                          onTap: () => _removeImage(index),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black54,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            padding: const EdgeInsets.all(4),
                                            child: const Icon(
                                              Icons.close,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: AppColors.softWhite),
                            ),
                            height: 100,
                            child: InkWell(
                              onTap: _pickMultiImages,
                              child: Center(
                                child: Text(t.noImagesSelected),
                              ),
                            ),
                          ),
                    const SizedBox(height: 22),
                    ElevatedButton(
                      style: elevatedButtonSmallStyle,
                      onPressed: () => _pickMultiImages(),
                      child: Text(t.chooseImages),
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
