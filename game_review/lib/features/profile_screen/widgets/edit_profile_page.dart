import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_theme.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/common/theme/border_size.dart';
import 'package:game_review/features/profile_screen/bloc/user_cubit.dart';
import 'package:game_review/features/profile_screen/bloc/user_state.dart';
import 'package:game_review/features/profile_screen/models/profile_info_model.dart';
import 'package:game_review/features/profile_screen/widgets/avatar.dart';
import 'package:game_review/i18n/strings.g.dart';

import '../../main_screen/widgets/app_scaffold.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _profileInfoFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _bioController = TextEditingController();

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _confirmPasswordKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();
  bool showPassword = false;
  bool showConfirmPassword = false;
  bool firstInput = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserProfileState>(
      bloc: locator<UserCubit>(),
      listener: (context, state) {},
      builder: (context, state) {
        return state.when(
          loading: () => Center(child: CircularProgressIndicator()),
          loaded: (user, loggedUserId, alreadyFriends, message) {
            _usernameController.text = user.username;
            _displayNameController.text = (user.displayName != null)
                ? user.displayName!
                : '';
            _bioController.text = (user.bio != null) ? user.bio! : '';
            return AppScaffold(
              appBar: AppBar(
                backgroundColor: AppColors.primaryPurple,
                leadingWidth: 110,
                leading: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Text(
                      t.common.back,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 400,
                      child: Stack(
                        children: [
                          Positioned(
                            top: -30,
                            left: 30,
                            right: 30,
                            child: Avatar(
                              imageUrl: user.avatarUrl,
                              onUpload: (imageUrl) async {
                                await locator<UserCubit>().updateAvatar(
                                  user.id,
                                  imageUrl,
                                );
                              },
                            ),
                          ),

                          Positioned(
                            top: 280,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                user.username,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 320,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                (user.displayName != null)
                                    ? user.displayName!
                                    : '-----',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28.0, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t.profile.profileInfo,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),

                          Form(
                            key: _profileInfoFormKey,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _usernameController,
                                    autocorrect: false,
                                    autofillHints: null,
                                    enableSuggestions: false,
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                    ),

                                    decoration: AppTheme.createInputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person_2_outlined,
                                      ),
                                      labelText: t.auth.username,
                                      labelStyle: AppTypography.editUser,
                                      borderRadius: BorderSize.infinite.radius,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: _displayNameController,
                                    autocorrect: false,
                                    autofillHints: null,
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                    ),

                                    enableSuggestions: false,
                                    decoration: AppTheme.createInputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person_2_outlined,
                                      ),
                                      labelText: t.auth.displayName,
                                      labelStyle: AppTypography.editUser,
                                      borderRadius: BorderSize.infinite.radius,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    controller: _bioController,
                                    minLines: 5,
                                    maxLines: null,
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                    ),
                                    decoration: AppTheme.createInputDecoration(
                                      alignLabelWithHint: true,
                                      label: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          t.profile.enterBio,
                                          style: AppTypography.editUser,
                                        ),
                                      ),
                                      labelStyle: AppTypography.editUser,
                                      borderRadius: BorderSize.l.radius,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      final profileInfoData = ProfileInfoModel(
                                        username: _usernameController.text,
                                        displayName:
                                            _displayNameController.text,
                                        bio: _bioController.text,
                                      );

                                      await locator<UserCubit>()
                                          .updateProfileInfo(
                                            user.id,
                                            profileInfoData,
                                          );
                                      await locator<UserCubit>()
                                          .fetchUserProfile(
                                            null,
                                            "Profile data saved.",
                                          );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 80,
                                        vertical: 10,
                                      ),
                                    ),
                                    child: Text(t.profile.saveProfile),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            t.auth.changePassword,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Form(
                            key: _passwordFormKey,
                            autovalidateMode: !firstInput
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    key: _passwordKey,
                                    controller: _passwordController,
                                    autocorrect: false,
                                    autofillHints: null,
                                    enableSuggestions: false,
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                    ),
                                    obscureText: !showPassword,
                                    onChanged: (value) {
                                      if (!firstInput) {
                                        _passwordKey.currentState?.validate();
                                        _confirmPasswordKey.currentState
                                            ?.validate();
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.length < 8) {
                                        return t.auth.passwordLength;
                                      }
                                      return null;
                                    },
                                    decoration: AppTheme.createInputDecoration(
                                      prefixIcon: Icon(Icons.password),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            showPassword = !showPassword;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.remove_red_eye_outlined,
                                        ),
                                      ),
                                      labelText: t.auth.password,
                                      labelStyle: AppTypography.editUser,
                                      borderRadius: BorderSize.infinite.radius,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    key: _confirmPasswordKey,
                                    autocorrect: false,
                                    autofillHints: null,
                                    enableSuggestions: false,
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                    ),
                                    controller: _confirmPasswordController,
                                    keyboardType: TextInputType.text,
                                    obscureText: !showConfirmPassword,
                                    onChanged: (value) {
                                      if (!firstInput) {
                                        _confirmPasswordKey.currentState
                                            ?.validate();
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return t.auth.confirmPassword;
                                      }
                                      if (value != _passwordController.text) {
                                        return t.auth.passwordMismatch;
                                      }
                                      return null;
                                    },
                                    decoration: AppTheme.createInputDecoration(
                                      prefixIcon: Icon(Icons.password),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            showConfirmPassword =
                                                !showConfirmPassword;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.remove_red_eye_outlined,
                                        ),
                                      ),
                                      labelText: t.auth.confirmPassword,
                                      labelStyle: AppTypography.editUser,
                                      borderRadius: BorderSize.infinite.radius,
                                    ),
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      if (_passwordFormKey.currentState!
                                          .validate()) {
                                        final registrationData =
                                            _passwordController.text;

                                        await locator<UserCubit>()
                                            .changePassword(
                                              registrationData,
                                              user,
                                            );
                                      } else {
                                        setState(() {
                                          firstInput = false;
                                        });
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 50,
                                        vertical: 10,
                                      ),
                                    ),
                                    child: Text(t.auth.changePassword),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          error: (message) {
            return Center(child: Text(message));
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _bioController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }
}
