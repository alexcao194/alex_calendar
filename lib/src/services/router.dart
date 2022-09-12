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
      case AppRoutes.loginPage:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case AppRoutes.forgotPasswordPage:
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      case AppRoutes.registryPage:
        return MaterialPageRoute(builder: (_) => RegistryPage());
      case AppRoutes.splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case AppRoutes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (_) => SignUpPage());
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
  static const String splashPage = '/';
  static const String homePage = '/home_page';
  static const String signUp = '/sign_up';
  static const String loginPage = '/login_page';
  static const String registryPage = '/registry_page';
  static const String forgotPasswordPage = '/forgotPasswordPage';
}