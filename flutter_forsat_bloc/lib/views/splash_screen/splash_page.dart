import 'package:flutter/material.dart';
import 'package:forsatbloc/utils/images.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 250,
            child: Center(
              child: Image.asset(Images.logo),
            ),
          ),
        ],
      ),
    );
  }
}