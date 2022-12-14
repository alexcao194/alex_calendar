// ignore_for_file: depend_on_referenced_packages

import 'package:alex_calendar/src/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:alex_calendar/src/bloc/data_bloc/data_bloc.dart';
import 'package:alex_calendar/src/bloc/navigation_bar_bloc/navigation_bar_bloc.dart';
import 'package:alex_calendar/src/bloc/user_bloc/user_bloc.dart';
import 'package:alex_calendar/src/constant/app_colors.dart';
import 'package:alex_calendar/src/constant/app_paths.dart';
import 'package:alex_calendar/src/constant/app_text_styles.dart';
import 'package:alex_calendar/src/services/date_time_handle.dart';
import 'package:alex_calendar/src/services/router.dart';
import 'package:alex_calendar/src/ui/common/widgets/stl/bottom_bar_item.dart';
import 'package:alex_calendar/src/ui/screens/home_page/page/achievements_page.dart';
import 'package:alex_calendar/src/ui/screens/home_page/page/calendar_month_page.dart';
import 'package:alex_calendar/src/ui/screens/home_page/page/calendar_week_page.dart';
import 'package:alex_calendar/src/ui/screens/home_page/page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

// Dart - Flutter
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
        builder: (context, navigationBarState) {
          return BlocBuilder<CalendarBloc, CalendarState>(
            builder: (context, calendarState) {
              return BlocBuilder<DataBloc, DataState>(
                builder: (context, dataState) {
                  return BlocBuilder<UserBloc, UserState>(
                    builder: (context, userState) {
                      return Scaffold(
                        backgroundColor: AppColors.paradiseBeachPrimary10,
                        appBar: buildAppBar(
                            navigationBarState, calendarState, context),
                        body: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PageView(
                              controller: pageController,
                              onPageChanged: (id) {
                                BlocProvider.of<NavigationBarBloc>(context)
                                    .add(
                                    NavigationBarEventOnChangePageView(id: id));
                              },
                              children: const [
                                CalendarMonthPage(),
                                CalendarWeekPage(),
                                AchievementsPage(),
                                SettingsPage()
                              ],
                            ),
                          ),
                        ),
                        bottomNavigationBar: buildBottomAppBar(pageController),
                        floatingActionButtonLocation:
                        FloatingActionButtonLocation.centerDocked,
                        floatingActionButton: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: FloatingActionButton(
                              backgroundColor: AppColors.paradiseBeachPrimary50,
                              onPressed: () {
                                AppRouter.navigatorKey.currentState?.pushNamed(AppRoutes.addTodo);
                              },
                              child: const Icon(Icons.add)),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        });
  }

  BottomAppBar buildBottomAppBar(PageController pageController) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomBarItem(
              asset: AppPath.table,
              label: 'Month',
              id: 0,
              pageController: pageController),
          BottomBarItem(
              asset: AppPath.calendarWeek,
              label: 'Week',
              id: 1,
              pageController: pageController),
          const SizedBox(width: 50),
          BottomBarItem(
              asset: AppPath.chair,
              label: 'Achievement',
              id: 2,
              pageController: pageController),
          BottomBarItem(
              asset: AppPath.setting,
              label: 'Settings',
              id: 3,
              pageController: pageController)
        ],
      ),
    );
  }

  AppBar buildAppBar(NavigationBarState navigationBarState,
      CalendarState calendarState, BuildContext context) {
    return AppBar(
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
      title: navigationBarState.currentId == 0
          ? Row(
        children: [
          TextButton(
              onPressed: () {
                BlocProvider.of<CalendarBloc>(context).add(
                    CalendarEventOnPickDate(
                        currentTime: calendarState.currentDate));
              },
              child: Text(
                  DateTimeHandle.toAppBarTitle(calendarState.focusDate),
                  style: AppTextStyles.calendarTitle)),
          const Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Colors.black,
          )
        ],
      )
          : null,
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.search, color: Colors.black),
        )
      ],
    );
  }
}
