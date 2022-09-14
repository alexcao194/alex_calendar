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
            icon: Icon(Icons.cancel, color: AppColors.paradiseBeachTertiary50)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.check, color: AppColors.paradiseBeachTertiary50),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddTodoItem(
                  child: Text('Title', style: AppTextStyles.titleAddTodoItem)),
              const SizedBox(height: 8.0),
              const AddTodoItem(
                  child: TextField(
                decoration:
                    InputDecoration.collapsed(hintText: 'Write title here...'),
              )),
              const SizedBox(height: 32.0),
              AddTodoItem(
                  child: Text('Description',
                      style: AppTextStyles.titleAddTodoItem)),
              const SizedBox(height: 8.0),
              const AddTodoItem(
                  child: TextField(
                minLines: 4,
                maxLines: 4,
                decoration: InputDecoration.collapsed(
                    hintText: 'Write something about this todo'),
              )),
              const SizedBox(height: 16.0),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 8.0,
                runSpacing: 8.0,
                children: const [
                  ChipRole(label: 'Working', isActive: false),
                  ChipRole(label: 'Learning', isActive: true),
                  ChipRole(label: 'Playing', isActive: false),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
