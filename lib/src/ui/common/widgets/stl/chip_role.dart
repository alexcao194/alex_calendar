// ignore_for_file: depend_on_referenced_packages

import 'package:alex_calendar/src/constant/app_colors.dart';
import 'package:alex_calendar/src/models/todo.dart';
import 'package:alex_calendar/src/ui/screens/add_toto_page/bloc/chip_bloc.dart';
import 'package:flutter/material.dart';
import 'package:alex_core/alex_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ChipRole extends StatelessWidget {
  const ChipRole(
      {Key? key, required this.label, required this.role})
      : super(key: key);

  final String label;
  final Roles role;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChipBloc, ChipState>(
      builder: (context, chipState) {
        return InkWellButton(
          backgroundColor: AppColors.paradiseBeachPrimary50,
          height: 35.0,
          width: 80.0,
          primaryColor: AppColors.paradiseBeachPrimary50,
          isActive: (chipState.role == role),
          child: Text(
              label,
              style: TextStyle(
                color: chipState.role == role ? Colors.white : AppColors
                    .paradiseBeachPrimary50,
                fontWeight: FontWeight.w500,
              )
          ),
          onTap: () {
            BlocProvider.of<ChipBloc>(context).add(ChipEventOnClick(role: role));
          },
        );
      },
    );
  }
}
