import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'dart:io' show Platform;

import 'package:forsatbloc/utils/images.dart';

Future<void> showLoadingDialog(BuildContext context) async {

  final spinkit = SpinKitFadingFour(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.blueAccent : Colors.blueAccent,
        ),
      );
    },
  );

  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      children: <Widget>[
        Center(
          child: Column(children: [
            Platform.isIOS ? spinkit: CircularProgressIndicator(),
            SizedBox(
              height: 15,
            ),
            Text(
              "Please Wait....",
              style: TextStyle(color: Colors.black),
            )
          ]),
        )
      ],
    ),
  );
}

Future<void> showLoadingDialogCupertino(BuildContext context) async {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: CupertinoActivityIndicator(radius: 20),
    ),
  );
}
