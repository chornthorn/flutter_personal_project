import 'package:flutter/material.dart';

showSnackBar(
    {@required GlobalKey<ScaffoldState> key,
      @required String message,
      Color color = Colors.red}) {
  return key.currentState.showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(message),
    ),
  );
}
