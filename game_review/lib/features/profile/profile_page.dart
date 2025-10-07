import 'package:flutter/material.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/auth/bloc/auth_cubit.dart';
import 'package:game_review/i18n/strings.g.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
          top: 250,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              'Rubrum',
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
              '@little_rubrum',
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
                    Text("ruby@gmail.com"),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
