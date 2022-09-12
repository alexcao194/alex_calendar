import 'dart:async';
import 'package:alex_calendar/src/services/router.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 1000), () {
      AppRouter.navigatorKey.currentState?.pushReplacementNamed(AppRoutes.loginPage);
    });
    return const Scaffold(
      body: Center(
        child: Text('Chờ app lốt đinh nha :>'),
      ),
    );
  }
}
