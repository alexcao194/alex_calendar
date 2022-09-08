// ignore_for_file: depend_on_referenced_packages

import 'package:alex_calendar/src/constant/app_colors.dart';
import 'package:alex_calendar/src/constant/app_paths.dart';
import 'package:alex_calendar/src/constant/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.paradiseBeachPrimary10,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 200,
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 30,
                  width: 30,
                child: SvgPicture.asset(AppPath.iconCoin, fit: BoxFit.fill),
              ),
            ),
            const Text('500', style: AppTextStyles.coinStyle)
          ],
        ),
        title: Row(
          children: const [
            Text('Jul, 2022', style: AppTextStyles.calendarTitle),
            Icon(Icons.keyboard_arrow_down_sharp, color: Colors.black,)
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search, color: Colors.black),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(1999, 19, 4),
            lastDay: DateTime.utc(2032, 28, 4),
            headerVisible: false,
          ),
        ),
      ),
    );
  }
}
