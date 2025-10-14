import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/features/profile_screen/bloc/user_cubit.dart';
import 'package:game_review/features/profile_screen/bloc/user_state.dart';
import 'package:game_review/features/profile_screen/services/user_service.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:image_picker/image_picker.dart';

class Avatar extends StatefulWidget {
  const Avatar({
    super.key,
    required this.imageUrl,
    required this.onUpload,
  });

  final String? imageUrl;
  final void Function(String imageUrl) onUpload;

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  String? _currentImageUrl;
  XFile? _selectedImage;
  Size? _imageSize;
  var imageBytes;
  var imagePath;
  var imageExtension;
  bool imageSelected = false;

  @override
  void initState() {
    super.initState();
    _currentImageUrl = widget.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserProfileState>(
      bloc: locator<UserCubit>(),
      builder: (context, state) {
        return state.when(
          loading: () => CircularProgressIndicator(),
          loaded: (user, loggedUserId, alreadyFriends, message) => Column(
            children: [
              Container(
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
                      top: 30,
                      left: 30,
                      right: 30,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: _selectedImage != null
                            ? FileImage(File(_selectedImage!.path))
                                  as ImageProvider
                            : _currentImageUrl != null
                            ? NetworkImage(_currentImageUrl!) as ImageProvider
                            : null,
                        child:
                            _selectedImage == null && _currentImageUrl == null
                            ? Center(
                                child: Text(
                                  t.noImage,
                                ),
                              )
                            : null,
                      ),
                    ),
                    Positioned(
                      top: 160,
                      left: 190,
                      right: 30,
                      child: Material(
                        color: Colors.transparent,
                        child: Center(
                          child: IconButton(
                            icon: Image.asset(
                              'lib/common/assets/icons/AddImageButton.png',
                            ),
                            color: AppColors.softWhite,
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery,
                              );
                              if (image == null) {
                                return;
                              } else {
                                setState(() {
                                  _selectedImage = image;
                                });
                              }
                              final imgBytes = await image.readAsBytes();
                              setState(() {
                                imageExtension = image.path
                                    .split('.')
                                    .last
                                    .toLowerCase();
                                imageBytes = imgBytes;
                                imagePath = '/${user.id}/profile';
                                imageSelected = true;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    ?((_selectedImage != null || _currentImageUrl != null)
                        ? Positioned(
                            top: 30,
                            left: 190,
                            right: 30,
                            child: Material(
                              color: Colors.transparent,
                              child: Center(
                                child: IconButton(
                                  icon: Image.asset(
                                    'lib/common/assets/icons/DeleteImageButton.png',
                                  ),
                                  color: AppColors.softWhite,
                                  onPressed: () async {
                                    await locator<UserCubit>().deleteAvatar(
                                      user.id,
                                      '/${user.id}/profile',
                                    );
                                    setState(() {
                                      _currentImageUrl = null;
                                      _selectedImage = null;
                                    });
                                  },
                                ),
                              ),
                            ),
                          )
                        : null),
                  ],
                ),
              ),

              ?(imageSelected
                  ? FilledButton(
                      onPressed: () async {
                        await locator<UserService>().uploadAvatar(
                          imagePath,
                          imageBytes,
                          imageExtension,
                        );
                        String imageUrl =
                            '${dotenv.env['API_URL']}/storage/v1/object/avatars/${imagePath}';
                        setState(() {
                          imageSelected = false;
                        });
                        widget.onUpload(imageUrl);
                      },

                      child: Text(t.saveImage),
                    )
                  : null),
            ],
          ),
          error: (message) => Center(child: Text('Error: $message')),
        );
      },
    );
  }
}
