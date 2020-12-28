import 'package:cuby_ebook/view/pages/auth/sign_in.dart';
import 'package:cuby_ebook/view/pages/auth/sign_up.dart';
import 'package:cuby_ebook/view/pages/onboards/onboard_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => OnBoardPage());
      case '/sign_in':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/sign_up':
        return MaterialPageRoute(builder: (_) => SignUpPage());
    }

    return generateRoute(settings);
  }
}
