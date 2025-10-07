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
            //borderRadius: BorderRadiusGeometry.circular(100),
              radius: 100,
              backgroundImage: AssetImage('lib/common/assets/images/tempAvatar.jpg'),),
        ),

      ],
    );
  }
}