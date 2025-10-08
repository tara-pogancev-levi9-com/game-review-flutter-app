import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/auth/auth_service.dart';
import 'package:game_review/features/auth/bloc/auth_cubit.dart';
import 'package:game_review/features/profile_screen/bloc/user_cubit.dart';
import 'package:game_review/features/profile_screen/bloc/user_state.dart';
import 'package:game_review/features/profile_screen/services/user_service.dart';
import 'package:game_review/i18n/strings.g.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    locator<UserCubit>().fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserProfileState>(
      bloc: locator<UserCubit>(),
      listener: (context, state) {},
      builder: (context, state) {
        if (state is UserProfileLoaded) {
          final user = state.user;
          return Stack(
            children: [
              Positioned(
                top: 30,
                left: 30,
                right: 30,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(
                    'lib/common/assets/images/tempAvatar.jpg',
                  ),
                ),
              ),
              Positioned(
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
                    Text(t.logout)
                  ],
                ),
              ),
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
                    //'@little_rubrum',
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
                          Text(user.email),
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
                            child: Text(
                              "I like to take walks in the forest and collect small butterflies. Once I got stuck in a spider’s web, and that is how I met Little Witch In The Woods. A good game. :) ",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      /*FilledButton(
                        onPressed: () {
                          locator<AuthCubit>().logout();
                        },
                        child: Text("Logout"),
                      ),*/
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
