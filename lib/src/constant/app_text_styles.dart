import 'package:alex_calendar/src/constant/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const calendarTitle = TextStyle(color: Colors.black, fontSize: 18);
  static const coinStyle = TextStyle(color: Colors.black, fontSize: 16);
  static TextStyle dayOfMCard = TextStyle(
      color: AppColors.paradiseBeachTertiary30,
      fontSize: 24,
      fontWeight: FontWeight.w700);
  static TextStyle dayOfWCard = TextStyle(
      color: AppColors.paradiseBeachTertiary30,
      fontSize: 12,
      fontWeight: FontWeight.w700);
  static TextStyle titleCard = TextStyle(
      color: AppColors.paradiseBeachPrimary50,
      fontSize: 14,
      fontWeight: FontWeight.w600);
  static TextStyle descriptionCard =
      TextStyle(color: AppColors.paradiseBeachTertiary80, fontSize: 12);
  static TextStyle header = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w900,
    color: AppColors.paradiseBeachPrimary50,
  );
  static TextStyle inkWellButtonStyle = TextStyle(
    color: AppColors.paradiseBeachPrimary50,
    fontWeight: FontWeight.w600
  );
  static TextStyle forgotPassword = TextStyle(
      color: AppColors.paradiseBeachPrimary50,
      decoration: TextDecoration.underline
  );
}
