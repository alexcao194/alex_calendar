// ignore_for_file: depend_on_referenced_packages

import 'package:alex_calendar/src/bloc/navigation_bar/navigation_bar_bloc.dart';
import 'package:alex_calendar/src/ui/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigationBarBloc())
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
      theme: ThemeData(

      ),
      home: const HomePage(),
    );
  }
}