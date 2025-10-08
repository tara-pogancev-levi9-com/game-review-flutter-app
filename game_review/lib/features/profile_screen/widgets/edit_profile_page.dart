import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/features/main_screen/widgets/appScaffold.dart';
import 'package:game_review/i18n/strings.g.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Container(
          height: 1200,
          child: Stack(
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
                top: 160,
                left: 190,
                right: 30,
                child: Material(
                  color: Colors.transparent,
                  child: Center(
                    child: InkWell(
                      splashColor: AppColors.softWhite,
                      child: IconButton(
                        icon: Image.asset(
                          'lib/common/assets/icons/AddImageButton.png',
                        ),
                        color: AppColors.softWhite,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 190,
                right: 30,
                child: Material(
                  color: Colors.transparent,
                  child: Center(
                    child: InkWell(
                      splashColor: AppColors.softWhite,
                      child: IconButton(
                        icon: Image.asset(
                          'lib/common/assets/icons/DeleteImageButton.png',
                        ),
                        color: AppColors.softWhite,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 300,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28.0, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profile Info",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),

                      Form(
                        //key: _formKey,
                        /*autovalidateMode: !firstInput
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,*/
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                          child: Column(
                            children: [
                              TextFormField(
                                //controller: _usernameController,
                                autocorrect: false,
                                autofillHints: null,
                                enableSuggestions: false,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person_2_outlined),
                                  labelText: t.username,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                //controller: _usernameController,
                                autocorrect: false,
                                autofillHints: null,
                                enableSuggestions: false,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person_2_outlined),
                                  labelText: t.displayName,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.multiline,
                                minLines: 5,
                                maxLines: null,

                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  label: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Enter bio...",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      color: AppColors.outline,
                                      width: 1,
                                    ),
                                  ),
                                  hintStyle: const TextStyle(
                                    color: AppColors.textSecondary,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      color: AppColors.outline,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      color: AppColors.primaryPurple,
                                      width: 1.2,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Save Profile"),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 80,
                                    vertical: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),
                      Text(
                        "Change Password",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Form(
                        //key: _formKey,
                        /*autovalidateMode: !firstInput
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,*/
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                          child: Column(
                            children: [
                              TextFormField(
                                //controller: _usernameController,
                                autocorrect: false,
                                autofillHints: null,
                                enableSuggestions: false,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.password_outlined),
                                  labelText: t.password,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                //controller: _usernameController,
                                autocorrect: false,
                                autofillHints: null,
                                enableSuggestions: false,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.password_outlined),
                                  labelText: t.confirmPassword,
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),


                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Change Password"),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 50,
                                    vertical: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
