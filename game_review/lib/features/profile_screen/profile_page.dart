import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/features/auth/bloc/auth_cubit.dart';
import 'package:game_review/features/main_screen/widgets/appScaffold.dart';
import 'package:game_review/features/profile_screen/bloc/user_cubit.dart';
import 'package:game_review/features/profile_screen/bloc/user_state.dart';
import 'package:game_review/i18n/strings.g.dart';

class ProfilePage extends StatefulWidget {
  final String currentUserId;
  final bool isStandalone;

  const ProfilePage({
    super.key,
    required this.currentUserId,
    this.isStandalone = false,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    locator<UserCubit>().fetchUserProfile(widget.currentUserId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserProfileState>(
      bloc: locator<UserCubit>(),
      listener: (context, state) {},
      builder: (context, state) {
        if (state is UserProfileLoaded) {
          final user = state.user;
          final pageContent = Stack(
            children: [
              Positioned(
                top: 30,
                left: 30,
                right: 30,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: (state.user.avatarUrl != null)
                      ? NetworkImage(state.user.avatarUrl!) as ImageProvider
                      : null,
                  child: user.avatarUrl == null
                      ? Center(
                          child: Text(
                            t.noImage,
                          ),
                        )
                      : null,
                ),
              ),
              ?(widget.currentUserId == state.loggedUserId)
                  ? Positioned(
                      top: 20,
                      left: 320,
                      right: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              locator<AuthCubit>().logout();
                            },
                            icon: Icon(
                              Icons.logout,
                              size: 30,
                            ),
                          ),
                          Text(t.logout),
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
                    //"Name",
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
                      ?(widget.isStandalone)
                          ? (state.alreadyFriends != null &&
                                    !state.alreadyFriends!)
                                ? ElevatedButton(
                                    onPressed: () {
                                      locator<UserCubit>().addFriend(
                                        state.loggedUserId,
                                        widget.currentUserId,
                                      );
                                      locator<UserCubit>().fetchUserProfile(
                                        widget.currentUserId,
                                      );
                                    },
                                    child: Text("Add Friend"),
                                  )
                                : OutlinedButton(
                                    onPressed: () {},
                                    child: Text("Friends"),
                                  )
                          : null,
                    ],
                  ),
                ),
              ),
            ],
          );
          if (widget.isStandalone) {
            return AppScaffold(
              appBar: AppBar(
                backgroundColor: AppColors.primaryPurple,
                leadingWidth: 100,
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
                      t.back,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              body: pageContent,
            );
          } else {
            return pageContent;
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
