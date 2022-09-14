import 'package:alex_calendar/src/constant/app_colors.dart';
import 'package:alex_calendar/src/constant/app_text_styles.dart';
import 'package:alex_calendar/src/services/router.dart';
import 'package:alex_calendar/src/ui/common/widgets/stl/add_todo_item.dart';
import 'package:alex_calendar/src/ui/common/widgets/stl/chip_role.dart';
import 'package:flutter/material.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            icon: Icon(
                Icons.cancel, color: AppColors.paradiseBeachTertiary50)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
                Icons.check, color: AppColors.paradiseBeachTertiary50),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title', style: AppTextStyles.titleAddTodoItem),
              const SizedBox(height: 8.0),
              const AddTodoItem(
                  child: TextField(
                    decoration:
                    InputDecoration.collapsed(
                        hintText: 'Write title here...'),
                  )),
              const SizedBox(height: 32.0),
              Text('Description',
                  style: AppTextStyles.titleAddTodoItem),
              const SizedBox(height: 8.0),
              const AddTodoItem(
                  child: TextField(
                    minLines: 4,
                    maxLines: 4,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Write something about this todo'),
                  )),
              const SizedBox(height: 32.0),
              Text('Date & Time',
                  style: AppTextStyles.titleAddTodoItem),
              const SizedBox(height: 8.0),
              const AddTodoItem(
                child: SizedBox(
                  height: 35.0,
                  child: Center(
                    child: TextField(
                      decoration:
                      InputDecoration.collapsed(hintText: '19/04/2003'),
                      enabled: false,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4.0),
              const AddTodoItem(
                child: SizedBox(
                  height: 35.0,
                  child: Center(
                    child: TextField(
                      decoration:
                      InputDecoration.collapsed(hintText: '16:00 - 18:00'),
                      enabled: false,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Text('Location', style: AppTextStyles.titleAddTodoItem),
              const SizedBox(height: 8.0),
              const AddTodoItem(
                  child: SizedBox(
                    height: 35.0,
                    child: Center(
                      child: TextField(
                        decoration:
                        InputDecoration.collapsed(hintText: 'Todo at ...'),
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
  }
}
