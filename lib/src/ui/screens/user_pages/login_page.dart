// ignore_for_file: depend_on_referenced_packages

import 'package:alex_calendar/src/bloc/data_bloc/data_bloc.dart';
import 'package:alex_calendar/src/bloc/user_bloc/user_bloc.dart';
import 'package:alex_calendar/src/constant/app_colors.dart';
import 'package:alex_calendar/src/constant/app_text_styles.dart';
import 'package:alex_calendar/src/services/router.dart';
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
    return BlocBuilder<UserBloc, UserState>(builder: (context, userState) {
      return BlocBuilder<DataBloc, DataState>(builder: (context, dataState) {
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
                          )),
                      const SizedBox(height: 4.0),
                      const Expanded(
                          child: Text('Đăng nhập',
                              style: TextStyle(fontSize: 30))),
                      const SizedBox(height: 64.0),
                      InputText(
                          height: 50,
                          label: 'Email',
                          controller: emailController,
                          obscureText: false),
                      const SizedBox(height: 8.0),
                      InputText(
                          height: 50,
                          label: 'Mật khẩu',
                          controller: passwordController,
                          obscureText: true),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                AppRouter.navigatorKey.currentState
                                    ?.pushNamed(AppRoutes.forgotPassword);
                              },
                              child: Text('Quên mật khẩu',
                                  style: AppTextStyles.forgotPassword),
                            ),
                            InkWellButton(
                              height: 40,
                              width: 80,
                              onTap: () {
                                setPreferences(emailController.value.text);
                                BlocProvider.of<UserBloc>(context).add(
                                    UserEventLogin(
                                        email: emailController.value.text,
                                        password:
                                            passwordController.value.text));
                              },
                              radius: 5.0,
                              primaryColor: AppColors.paradiseBeachPrimary50,
                              child: Text('Đăng nhập',
                                  style: AppTextStyles.inkWellButtonStyle),
                            )
                          ],
                        ),
                      ),
                      Text(
                          userState is UserStateLoginFail
                              ? userState.error
                              : '',
                          style: TextStyle(
                            color: AppColors.error,
                          )),
                      const Expanded(child: SizedBox()),
                      Center(
                        child: GestureDetector(
                            onTap: () {
                              AppRouter.navigatorKey.currentState
                                  ?.pushNamed(AppRoutes.signUp);
                            },
                            child: Text(
                              'SignUp',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.paradiseBeachPrimary50),
                            )),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                  userState is UserStateLoading
                      ? const CircularProgressIndicator()
                      : const SizedBox()
                ],
              ),
            ),
          ),
        );
      });
    });
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
