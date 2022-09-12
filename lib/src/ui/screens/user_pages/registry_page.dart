// ignore_for_file: depend_on_referenced_packages

import 'package:alex_calendar/src/bloc/date_picker_bloc/date_picker_bloc.dart';
import 'package:alex_calendar/src/bloc/user_bloc/user_bloc.dart';
import 'package:alex_calendar/src/constant/app_colors.dart';
import 'package:alex_calendar/src/constant/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alex_core/alex_core.dart';

class RegistryInformation extends StatelessWidget {
  RegistryInformation({Key? key}) : super(key: key);

  final displayNameController = TextEditingController();
  final nickNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          return BlocBuilder<DatePickerBloc, DatePickerState>(
              builder: (context, dateState) {
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
                              Expanded(child: Text('Thông tin', style: TextStyle(fontSize: 30))), // TODO: handle textStyle
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: SizedBox(
                                  height: 300.0,
                                  width: 300.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(300.0),
                                    child: Image.network(
                                      AppStrings.defaultAvatar,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(height: 64, color: Colors.transparent),
                              InputText(label: 'Họ và tên', controller: displayNameController),
                              const SizedBox(height: 8.0),
                              InputText(label: 'Nickname', controller: nickNameController),
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<DatePickerBloc>(context).add(DatePickerEventOnPick(currentTime: dateState.time, context: context));
                                },
                                child: InputText(
                                    label:  simpleDateFormat(dateState.time),
                                    enable: false
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(),
                                    InkWellButton(
                                      onTap: () {
                                        BlocProvider.of<UserBloc>(context).add(
                                            UserEventRegistry(
                                                displayName: displayNameController.value.text,
                                                avatarURL: AppStrings.defaultAvatar,
                                                birthday: simpleDateFormat(dateState.time),
                                                nickName: nickNameController.value.text
                                            )
                                        );
                                      },
                                      radius: 5.0,
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                userState is UserStateRegistryFail ? userState.error : "",
                                style: const TextStyle(
                                    color: Colors.red
                                ),
                              ),
                              Text(
                                userState is UserStateRegistrySuccessful ? userState.status : "",
                                style: TextStyle(
                                    color: AppColors.paradiseBeachPrimary50
                                ),
                              ),
                              const Expanded(child: SizedBox()),
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

  simpleDateFormat(DateTime time) {
    final localTime = time.toLocal();
    return '${localTime.day}/${localTime.month}/${localTime.year}';
  }


}
