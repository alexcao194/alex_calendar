// ignore_for_file: depend_on_referenced_packages
import 'package:alex_calendar/src/bloc/navigation_bar_bloc/navigation_bar_bloc.dart';
import 'package:alex_calendar/src/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(
      {Key? key,
      required this.asset,
      required this.label,
      required this.id,
      required this.pageController})
      : super(key: key);
  final PageController pageController;
  final String asset;
  final String label;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
        builder: (context, navigationBarState) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<NavigationBarBloc>(context)
                  .add(NavigationBarEventOnChangeItem(id: id, pageController: pageController));
            },
            child: Column(
              children: [
                SvgPicture.asset(asset,
                    color: id == navigationBarState.currentId
                        ? AppColors.paradiseBeachPrimary50
                        : AppColors.paradiseBeachTertiary20),
                Text(label,
                    style: TextStyle(
                        color: id == navigationBarState.currentId
                            ? AppColors.paradiseBeachPrimary50
                            : AppColors.paradiseBeachTertiary20))
              ],
            ),
          ),
        ),
      );
    });
  }
}
