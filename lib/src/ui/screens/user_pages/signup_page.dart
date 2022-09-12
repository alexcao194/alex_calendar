// ignore_for_file: depend_on_referenced_packages

import 'package:alex_calendar/src/bloc/user_bloc/user_bloc.dart';
import 'package:alex_calendar/src/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alex_core/alex_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 32.0),
                        Text('Alex Database',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w900,
                              color: AppColors.paradiseBeachPrimary50,
                            )
                        ),
                        const SizedBox(height: 4.0),
                        const Expanded(child: Text('Đăng kí', style: TextStyle(fontSize: 30))),
                        Container(height: 64, color: Colors.transparent),
                        InputText(label: 'Email', controller: emailController),
                        const SizedBox(height: 8.0),
                        InputText(label: 'Mật khẩu', controller: passwordController),
                        const SizedBox(height: 8.0),
                        InputText(label: 'Nhập lại mật khẩu', controller: rePasswordController),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              InkWellButton(
                                onTap: () {
                                  setPreferences(emailController.value.text);
                                  BlocProvider.of<UserBloc>(context).add(
                                      UserEventSignUp(
                                          email: emailController.value.text,
                                          password: passwordController.value.text,
                                          rePassword: rePasswordController.value.text,
                                          context: context
                                      )
                                  );
                                },
                                radius: 5.0
                              )
                            ],
                          ),
                        ),
                        Text(
                          state is UserStateSignUpFail ? state.error : "",
                          style: const TextStyle(
                              color: Colors.red
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    state is UserStateLoading ? const CircularProgressIndicator() : const SizedBox()
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  setPreferences(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
  }
}
