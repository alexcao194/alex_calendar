import 'package:alex_calendar/src/constant/app_colors.dart';
import 'package:flutter/material.dart';

class AddTodoTitle extends StatelessWidget {
  const AddTodoTitle({Key? key, required this.child,required this.leading}) : super(key: key);

  final IconData leading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          leading,
          color: AppColors.paradiseBeachTertiary50,
        ),
        const SizedBox(width: 8.0),
        child
      ],
    );
  }
}
