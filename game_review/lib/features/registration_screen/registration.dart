import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/features/registration_screen/bloc/registerCubit.dart';
import 'package:game_review/features/registration_screen/models/loginModel.dart';
import 'package:game_review/features/registration_screen/models/registrationModel.dart';

import '../../i18n/strings.g.dart';
import 'bloc/registrationState.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool showPassword = false;
  bool showConfirmPassword = false;
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();
  final _emailKey = GlobalKey<FormFieldState>();

  bool firstInput = true;

  RegExp get _emailRegex => RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  @override
  Widget build(BuildContext context) {
    final gradients = Theme.of(context).extension<AppGradients>()!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
      body: BlocConsumer<RegistrationCubit, RegistrationState>(
        bloc: locator<RegistrationCubit>(),
        listener: (context, state) {
          if (state is RegistrationSuccess) {
            locator<RegistrationCubit>().login(
              LoginModel(
                email: _emailController.text,
                password: _passwordController.text,
              ),
            );
          } else if (state is RegistrationInitial) {
          } else if (state is RegistrationDuplicateEmail) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          } else if (state is RegistrationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
            //locator<RegistrationCubit>().clearFailure();
            /*locator<RegistrationCubit>().formValidityChanged(
              isFormValid: _formKey.currentState?.validate() ?? false,
            );*/
          } else if (state is LoginAfterRegistrationSuccess) {
            //TODO: implement navigation
            /*Future.delayed(const Duration(seconds: 1), () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            });*/
          } else if (state is LoginAfterRegistrationFailure) {
            //TODO: implement navigation
            /*Future.delayed(const Duration(seconds: 1), () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            });*/
          }
        },
        builder: (context, state) {
          final isLoading = state is RegistrationLoading;

          return Stack(
            children: [
              AbsorbPointer(
                absorbing: isLoading,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(gradient: gradients.background),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsGeometry.fromLTRB(0, 150, 0, 0),
                          child: Image(
                            image: AssetImage(
                              'lib/common/assets/images/Logo.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Form(
                          key: _formKey,
                          autovalidateMode: !firstInput
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.disabled,

                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Column(
                              children: [
                                TextFormField(
                                  key: _emailKey,
                                  autocorrect: false,
                                  autofillHints: null,
                                  enableSuggestions: false,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  onChanged: (value) {
                                    if (!firstInput)
                                      _emailKey.currentState?.validate();
                                  },
                                  validator: (value) => emailValidator(value),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email_outlined),
                                    labelText: t.email,
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
                                  controller: _usernameController,
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
                                  key: _passwordKey,
                                  controller: _passwordController,
                                  autocorrect: false,
                                  autofillHints: null,
                                  enableSuggestions: false,
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
                                      return t.passwordLength;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.password),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showPassword = !showPassword;
                                        });
                                      },
                                      icon: Icon(Icons.remove_red_eye_outlined),
                                    ),
                                    errorStyle: null,
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
                                  key: _confirmPasswordKey,
                                  autocorrect: false,
                                  autofillHints: null,
                                  enableSuggestions: false,
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
                                      return t.confirmPassword;
                                    }
                                    if (value != _passwordController.text) {
                                      return t.passwordMismatch;
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.password),

                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showConfirmPassword =
                                              !showConfirmPassword;
                                        });
                                      },
                                      icon: Icon(Icons.remove_red_eye_outlined),
                                    ),
                                    labelText: t.confirmPassword,
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 40,
                                        ),

                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              final registrationData =
                                                  RegistrationModel(
                                                    email:
                                                        _emailController.text,
                                                    username:
                                                        _usernameController
                                                            .text,
                                                    password:
                                                        _passwordController
                                                            .text,
                                                  );

                                              locator<RegistrationCubit>()
                                                  .signup(
                                                    registrationData,
                                                  );
                                            } else {
                                              //locator<RegistrationCubit>()
                                              //  .formValidationFailed();
                                              setState(() {
                                                firstInput = false;
                                              });
                                            }
                                          },
                                          child: Text(
                                            t.register,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (isLoading)
                const Opacity(
                  opacity: 0.3,
                  child: ModalBarrier(
                    dismissible: false,
                    color: Colors.black38,
                  ),
                ),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }

  String? emailValidator(value) {
    if (value == null || !_emailRegex.hasMatch(value)) {
      return t.emailInvalid;
    }
    return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }
}
