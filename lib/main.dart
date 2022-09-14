// ignore_for_file: depend_on_referenced_packages

import 'package:alex_calendar/src/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:alex_calendar/src/bloc/data_bloc/data_bloc.dart';
import 'package:alex_calendar/src/bloc/navigation_bar_bloc/navigation_bar_bloc.dart';
import 'package:alex_calendar/src/bloc/user_bloc/user_bloc.dart';
import 'package:alex_calendar/src/services/router.dart';
import 'package:alex_calendar/src/ui/screens/add_toto_page/bloc/chip_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigationBarBloc()),
          BlocProvider(create: (context) => CalendarBloc()),
          BlocProvider(create: (context) => UserBloc()),
          BlocProvider(create: (context) => DataBloc()),
          BlocProvider(create: (context) => ChipBloc())
        ],
        child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.splash,
      navigatorKey: AppRouter.navigatorKey,
    );
  }
}