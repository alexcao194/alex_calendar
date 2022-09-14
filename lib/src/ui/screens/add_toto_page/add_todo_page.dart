import 'package:alex_calendar/src/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:alex_calendar/src/bloc/data_bloc/data_bloc.dart';
import 'package:alex_calendar/src/bloc/user_bloc/user_bloc.dart';
import 'package:alex_calendar/src/constant/app_colors.dart';
import 'package:alex_calendar/src/constant/app_text_styles.dart';
import 'package:alex_calendar/src/models/todo.dart';
import 'package:alex_calendar/src/services/date_time_handle.dart';
import 'package:alex_calendar/src/services/router.dart';
import 'package:alex_calendar/src/ui/common/widgets/stl/add_todo_item.dart';
import 'package:alex_calendar/src/ui/common/widgets/stl/add_todo_title.dart';
import 'package:alex_calendar/src/ui/common/widgets/stl/chip_role.dart';
import 'package:alex_calendar/src/ui/screens/add_toto_page/bloc/chip_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();
  final TextEditingController timeOfDayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, calendarState) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, userState) {
            return BlocBuilder<ChipBloc, ChipState>(
              builder: (context, chipState) {
                return Scaffold(
                  backgroundColor: AppColors.paradiseBeachPrimary10,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    title: Center(
                        child: Text('Add Todo',
                            style: AppTextStyles.titleAddTodoPage)),
                    leading: IconButton(
                        onPressed: () {
                          AppRouter.navigatorKey.currentState?.pop();
                        },
                        icon: Icon(Icons.cancel,
                            color: AppColors.paradiseBeachTertiary50)),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: IconButton(
                          icon: Icon(Icons.check,
                              color: AppColors.paradiseBeachTertiary50),
                          onPressed: () {
                            BlocProvider.of<DataBloc>(context).add(
                                DataEventAddTodo(
                                    user:
                                        userState is UserStateLoginSuccessful
                                            ? userState.user
                                            : null,
                                    todo: Todo(
                                        scheduleTime: timeOfDayController.value.text,
                                        role: chipState.role,
                                        location: locationController.value.text,
                                        date: dateTimeController.value.text,
                                        description: descriptionController.value.text,
                                        title: titleController.value.text)));
                          },
                        ),
                      )
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AddTodoTitle(
                              leading: Icons.title,
                              child: Text('Title',
                                  style: AppTextStyles.titleAddTodoItem)),
                          const SizedBox(height: 8.0),
                          AddTodoItem(
                              child: TextField(
                            controller: titleController,
                            decoration: const InputDecoration.collapsed(
                                hintText: 'Write title here...'),
                          )),
                          const SizedBox(height: 32.0),
                          AddTodoTitle(
                              leading: Icons.description,
                              child: Text('Description',
                                  style: AppTextStyles.titleAddTodoItem)),
                          const SizedBox(height: 8.0),
                          AddTodoItem(
                              child: TextField(
                            controller: descriptionController,
                            minLines: 4,
                            maxLines: 4,
                            decoration: const InputDecoration.collapsed(
                                hintText: 'Write something about this todo'),
                          )),
                          const SizedBox(height: 32.0),
                          AddTodoTitle(
                              leading: Icons.date_range,
                              child: Text('Date & Time',
                                  style: AppTextStyles.titleAddTodoItem)),
                          const SizedBox(height: 8.0),
                          AddTodoItem(
                            child: SizedBox(
                              height: 35.0,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<CalendarBloc>(context).add(
                                        CalendarEventOnChangeAddTodoDate(
                                            currentTime: DateTime.now()));
                                  },
                                  child: TextField(
                                    decoration: InputDecoration.collapsed(
                                        hintText: DateTimeHandle
                                            .simpleDateFormat(calendarState
                                                    is CalendarStateChangedAddTodoDate
                                                ? calendarState.currentDate
                                                : DateTime.now())),
                                    enabled: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          AddTodoItem(
                            child: SizedBox(
                              height: 35.0,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<CalendarBloc>(context).add(
                                        CalendarEventOnPickTimeAddTodoPage(
                                            currentTime: TimeOfDay.now()));
                                  },
                                  child: TextField(
                                    decoration: InputDecoration.collapsed(
                                        hintText: calendarState
                                                is CalendarStateChangedAddTodoTime
                                            ? ('${DateTimeHandle.simpleTimeFormat(calendarState.startTime)} - ${DateTimeHandle.simpleTimeFormat(calendarState.endTime)}')
                                            : 'Chọn một khoảng thời gian'),
                                    enabled: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32.0),
                          AddTodoTitle(
                              leading: Icons.airplanemode_on,
                              child: Text('Location',
                                  style: AppTextStyles.titleAddTodoItem)),
                          const SizedBox(height: 8.0),
                          AddTodoItem(
                              child: SizedBox(
                            height: 35.0,
                            child: Center(
                              child: TextField(
                                controller: locationController,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'Todo at ...'),
                              ),
                            ),
                          )),
                          const SizedBox(height: 32.0),
                          Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: const [
                              ChipRole(label: 'Working', role: Roles.working),
                              ChipRole(label: 'Learning', role: Roles.learning),
                              ChipRole(label: 'Playing', role: Roles.playing),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
