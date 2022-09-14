import 'package:alex_calendar/src/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:alex_core/alex_core.dart';

class ChipRole extends StatelessWidget {
  const ChipRole({Key? key, required this.label, required this.isActive}) : super(key: key);

  final bool isActive;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWellButton(
      backgroundColor: AppColors.paradiseBeachPrimary50,
      height: 35.0,
      width: 80.0,
      primaryColor: AppColors.paradiseBeachPrimary50,
      isActive: isActive,
      child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : AppColors.paradiseBeachPrimary50,
            fontWeight: FontWeight.w500,
          )
      ),
    );
  }
}
