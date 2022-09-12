// ignore_for_file: depend_on_referenced_packages

import 'package:alex_calendar/src/bloc/data_bloc/data_bloc.dart';
import 'package:alex_calendar/src/bloc/user_bloc/user_bloc.dart';
import 'package:alex_calendar/src/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:alex_core/alex_core.dart';
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    loadPreferences();
    return BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          return BlocBuilder<DataBloc, DataState>(
              builder: (context, dataState) {
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
                              Expanded(child: Text('Đăng nhập', style: TextStyle(fontSize: 30))), // TODO: handle text style here
                              const SizedBox(height: 64.0),
                              InputText(label: 'Email', controller: emailController, obscureText: false),
                              const SizedBox(height: 8.0),
                              InputText(label: 'Mật khẩu', controller: passwordController, obscureText: true),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // TODO: handle navigation here
                                      },
                                      child: Text(
                                          'Quên mật khẩu',
                                          style: TextStyle(
                                              // TODO: handle textStyle
                                              color: AppColors.paradiseBeachPrimary50,
                                              decoration: TextDecoration.underline
                                          )
                                      ),
                                    ),
                                    InkWellButton(
                                      onTap: () {
                                        setPreferences(emailController.value.text);
                                        BlocProvider.of<UserBloc>(context).add(
                                            UserEventLogin(
                                                context: context,
                                                email: emailController.value.text,
                                                password: passwordController.value.text
                                            )
                                        );
                                      },
                                      radius: 5.0,
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                  userState is UserStateLoginFail ? userState.error : '',
                                  style: const TextStyle(
                                    color: Colors.red,
                                  )
                              ),
                              const Expanded(child: SizedBox()),
                              Center(
                                child: GestureDetector(
                                    onTap: () {
                                      // TODO: handle navigation
                                    },
                                    child: Text(
                                      'SignUp',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: AppColors.paradiseBeachPrimary50
                                      ),
                                    )
                                ),
                              ),
                              const SizedBox(height: 8.0)
                            ],
                          ),
                          userState is UserStateLoading ? const CircularProgressIndicator() : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                );
              }
          );
        }
    );
  }

  void loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailController.text = prefs.getString('email') ?? '';
  }

  void setPreferences(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
  }
}
