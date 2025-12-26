import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/features/auth/bloc/auth_cubit.dart';
import 'package:game_review/features/main_screen/widgets/header_widget.dart';
import 'package:game_review/features/profile_screen/bloc/user_cubit.dart';
import 'package:game_review/features/profile_screen/bloc/user_state.dart';
import 'package:game_review/features/welcome_screen/welcome_page.dart';
import 'package:game_review/i18n/strings.g.dart';

import '../main_screen/widgets/app_scaffold.dart';

class ProfilePage extends StatefulWidget {
  final String? currentUserId;
  final bool isStandalone;

  const ProfilePage({
    super.key,
    this.currentUserId,
    this.isStandalone = false,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    locator<UserCubit>().initData(widget.currentUserId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserProfileState>(
      bloc: locator<UserCubit>(),
      listener: (context, state) {
        state.whenOrNull(
          loaded: (user, loggedUserId, alreadyFriends, message) {
            if (message != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppColors.success,
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
        );
      },
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (user, loggedUserId, alreadyFriends, message) {
            final pageContent = Stack(
              children: [
                Positioned(
                  top: 30,
                  left: 30,
                  right: 30,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: AppColors.textTertiary,
                    backgroundImage: (user.avatarUrl != null)
                        ? NetworkImage(user.avatarUrl!) as ImageProvider
                        : null,
                    child: (user.avatarUrl == null)
                        ? ClipOval(
                            child: Image(
                              fit: BoxFit.contain,
                              image: (user.avatarUrl != null)
                                  ? NetworkImage(user.avatarUrl!)
                                        as ImageProvider
                                  : const AssetImage(
                                      'lib/common/assets/images/blankAvatarSmall.png',
                                    ),
                            ),
                          )
                        : null,
                  ),
                ),
                ?(!widget.isStandalone)
                    ? Positioned(
                        top: 20,
                        left: 320,
                        right: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () async {
                                await locator<AuthCubit>().logout();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WelcomePage(),
                                  ),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              icon: Icon(
                                Icons.logout,
                                size: 30,
                              ),
                            ),
                            Text(t.auth.logout),
                          ],
                        ),
                      )
                    : null,
                Positioned(
                  top: 250,
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
                  top: 290,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      (user.displayName != null) ? user.displayName! : ' ',

                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                Positioned(
                  top: 300,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ImageIcon(
                              AssetImage('lib/common/assets/icons/E-mail.png'),
                              size: 20,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(child: Text(user.email)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text((user.bio != null) ? user.bio! : ' '),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ?(widget.isStandalone && loggedUserId != user.id)
                            ? (alreadyFriends != null && !alreadyFriends)
                                  ? ElevatedButton(
                                      onPressed: () {
                                        locator<UserCubit>().addFriend(
                                          loggedUserId,
                                          widget.currentUserId,
                                        );
                                      },
                                      child: Text(t.profile.addFriend),
                                    )
                                  : OutlinedButton(
                                      onPressed: () {},
                                      child: Text(t.profile.friends),
                                    )
                            : null,
                      ],
                    ),
                  ),
                ),
              ],
            );
            if (widget.isStandalone) {
              return Container(
                decoration: BoxDecoration(color: AppColors.primaryPurple),
                child: AppScaffold(
                  appBar: CustomHeader(
                    isHome: false,
                    onBack: () => Navigator.pop(context),
                  ),

                  body: pageContent,
                ),
              );
            } else {
              return pageContent;
            }
          },
          error: (message) {
            return Center(
              child: Column(
                children: [
                  Text(message),
                  IconButton(
                    onPressed: () async {
                      await locator<AuthCubit>().logout();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomePage(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },
                    icon: Icon(
                      Icons.logout,
                      size: 30,
                    ),
                  ),
                  Text(t.auth.logout),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
