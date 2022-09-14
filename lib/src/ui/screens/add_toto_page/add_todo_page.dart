import 'package:alex_calendar/src/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:alex_calendar/src/constant/app_colors.dart';
import 'package:alex_calendar/src/constant/app_text_styles.dart';
import 'package:alex_calendar/src/services/date_time_handle.dart';
import 'package:alex_calendar/src/services/router.dart';
import 'package:alex_calendar/src/ui/common/widgets/stl/add_todo_item.dart';
import 'package:alex_calendar/src/ui/common/widgets/stl/add_todo_title.dart';
import 'package:alex_calendar/src/ui/common/widgets/stl/chip_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, calendarState) {
        return Scaffold(
          backgroundColor: AppColors.paradiseBeachPrimary10,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Center(
                child: Text('Add Todo', style: AppTextStyles.titleAddTodoPage)),
            leading: IconButton(
                onPressed: () {
                  AppRouter.navigatorKey.currentState?.pop();
                },
                icon: Icon(Icons.cancel,
                    color: AppColors.paradiseBeachTertiary50)),
            actions: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                    Icon(Icons.check, color: AppColors.paradiseBeachTertiary50),
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
                      child:
                          Text('Title', style: AppTextStyles.titleAddTodoItem)),
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
                            BlocProvider.of<CalendarBloc>(context).add(CalendarEventOnChangeAddTodoDate(currentTime: DateTime.now()));
                          },
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                                hintText: DateTimeHandle.simpleDateFormat(
                                    calendarState
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
                            BlocProvider.of<CalendarBloc>(context).add(CalendarEventOnPickTimeAddTodoPage(currentTime: TimeOfDay.now()));
                          },
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                                hintText: calendarState is CalendarStateChangedAddTodoTime ? ('${DateTimeHandle.simpleTimeFormat(calendarState.startTime)} - ${DateTimeHandle.simpleTimeFormat(calendarState.endTime)}') : 'Chọn một khoảng thời gian'
                            ),
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
                      ChipRole(label: 'Working', id: 0),
                      ChipRole(label: 'Learning', id: 1),
                      ChipRole(label: 'Playing', id: 2),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
