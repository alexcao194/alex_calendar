// ignore_for_file: depend_on_referenced_packages

import 'package:alex_calendar/src/bloc/user_bloc/user_bloc.dart';
import 'package:alex_calendar/src/constant/app_colors.dart';
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
                              color: AppColors.paradiseBeachSecondary50,
                            )
                        ),
                        const SizedBox(height: 4.0),
                        Expanded(child: Text('Quên mật khẩu', style: TextStyle(fontSize: 30))), // Handle text style
                        Container(height: 64, color: Colors.transparent),
                        InputText(label: 'Email', controller: emailController, obscureText: false),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Material(
                                  color:Colors.transparent,
                                  child: InkWell(
                                      splashColor: AppColors.paradiseBeachPrimary50,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          const BorderRadius.all(Radius.circular(5.0)),
                                          border: Border.all(color: AppColors.paradiseBeachPrimary50, width: 1.5),
                                        ),
                                        height: 40.0,
                                        width: 100.0,
                                        child: Center(
                                            child: Text('Lấy mật khẩu',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.paradiseBeachPrimary50,
                                                )
                                            )
                                        ),
                                      ),
                                      onTap: () {
                                        BlocProvider.of<UserBloc>(context).add(UserEventGetPassword(email: emailController.value.text));
                                      }
                                  ),
                                ),
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
