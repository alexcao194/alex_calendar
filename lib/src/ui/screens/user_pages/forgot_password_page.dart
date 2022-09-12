// ignore_for_file: depend_on_referenced_packages

import 'package:alex_calendar/src/bloc/user_bloc/user_bloc.dart';
import 'package:alex_calendar/src/constant/app_colors.dart';
import 'package:alex_calendar/src/constant/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:alex_core/alex_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();

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
                        const Expanded(child: Text('Quên mật khẩu', style: TextStyle(fontSize: 30))),
                        Container(height: 64, color: Colors.transparent),
                        InputText(height: 50, label: 'Email', controller: emailController, obscureText: false),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              InkWellButton(
                                height: 40,
                                width: 120,
                                radius: 5.0,
                                primaryColor: AppColors.paradiseBeachPrimary50,
                                onTap: () {
                                  BlocProvider.of<UserBloc>(context).add(UserEventGetPassword(email: emailController.value.text));
                                },
                                child: Text('Lấy mật khẩu', style: AppTextStyles.inkWellButtonStyle),
                              )
                            ],
                          ),
                        ),
                        Text(
                          state is UserStateGetPasswordFail ? state.error : "",
                          style: const TextStyle(
                              color: Colors.red
                          ),
                        ),
                        Text(
                          state is UserStateGetPasswordSuccessful ? state.status : "",
                          style: TextStyle(
                              color: AppColors.paradiseBeachPrimary50
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
}
