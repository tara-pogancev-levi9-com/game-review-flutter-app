import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/features/registration_screen/bloc/registerCubit.dart';
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

  RegExp get _emailRegex => RegExp(r'^\S+@\S+$');
  @override
  Widget build(BuildContext context) {
    final gradients = Theme.of(context).extension<AppGradients>()!;
    final registrationCubit = context.read<RegistrationCubit>();

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
              "Back",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      body: BlocConsumer<RegistrationCubit, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registration successful!')),
            );
            // TODO: Navigate to LoginScreen
            /*Future.delayed(const Duration(seconds: 1), () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            });*/
          } else if (state is RegistrationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.error}')),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is RegistrationLoading;
          final isFailure = state is RegistrationFailure;

          return Stack(
            children: [AbsorbPointer(
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
                          image: AssetImage('lib/common/assets/images/Logo.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            children: [
                              TextFormField(
                                key: _emailKey,
                                controller: _emailController,
                                onChanged: (value) {
                                  _emailKey.currentState?.validate();
                                },
                                validator: (value) {
                                  if (value == null ||
                                      !_emailRegex.hasMatch(value)) {
                                    return 'Email address is not valid';
                                  }
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined),
                                  labelText: "Email",
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
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person_2_outlined),
                                  labelText: "Username",
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
                                obscureText: !showPassword,
                                onChanged: (value) {
                                  _passwordKey.currentState?.validate();
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length < 8) {
                                    return 'Password must be at least 8 characters long!';
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
                                  labelText: "Password",
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
                                controller: _confirmPasswordController,
                                keyboardType: TextInputType.text,
                                obscureText: !showConfirmPassword,
                                onChanged: (value) {
                                  _confirmPasswordKey.currentState?.validate();
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your password!';
                                  }
                                  if (value != _passwordController.text) {
                                    return 'Passwords do not match!';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.password),

                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showConfirmPassword = !showConfirmPassword;
                                      });
                                    },
                                    icon: Icon(Icons.remove_red_eye_outlined),
                                  ),
                                  labelText: "Confirm password",
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
                                          if (_formKey.currentState!.validate()) {
                                            final registrationData =
                                                RegistrationModel(
                                                  email: _emailController.text,
                                                  username:
                                                      _usernameController.text,
                                                  password:
                                                      _passwordController.text,
                                                );
                                            registrationCubit.signup(
                                              registrationData,
                                            );
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
              if (isLoading || isFailure)
                const Opacity(
                  opacity: 0.3,
                  child: ModalBarrier(dismissible: false, color: Colors.black38),
                ),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              if(isFailure)
                Center(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Text("Error occurred"),
                  ),
                )
          ]
          );
        },
      ),
    );
  }
}
