import 'package:alex_calendar/src/ui/screens/add_toto_page/add_todo_page.dart';
import 'package:alex_calendar/src/ui/screens/home_page/home_page.dart';
import 'package:alex_calendar/src/ui/screens/splash_page/splash_page.dart';
import 'package:alex_calendar/src/ui/screens/user_pages/forgot_password_page.dart';
import 'package:alex_calendar/src/ui/screens/user_pages/login_page.dart';
import 'package:alex_calendar/src/ui/screens/user_pages/registry_page.dart';
import 'package:alex_calendar/src/ui/screens/user_pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      case AppRoutes.registry:
        return MaterialPageRoute(builder: (_) => RegistryPage());
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case AppRoutes.addTodo:
        return MaterialPageRoute(builder: (_) => AddTodoPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              appBar: AppBar(),
              body: const Center(
                  child: Text('Fallback')),
            ));
    }
  }
}

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String signUp = '/sign_up';
  static const String login = '/login';
  static const String registry = '/registry';
  static const String forgotPassword = '/forgot_password';
  static const String addTodo = '/add_todo';
}