import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: SvgPicture.asset('assets/icons/app_logo.svg'),
        ),
      ),
    );
  }
}
