import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:forsatbloc/index.dart';

class CustomDialog {

  static void successDialog() {
    BuildContext context = navigatorKey.currentState.overlay.context;
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text("ทำรายการสำเร็จ"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new RaisedButton(
              color: Colors.blue,
              child: new Text("ตกลง", style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
    );
  }

  static void errorDialog() {
    BuildContext context = navigatorKey.currentState.overlay.context;
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text("เกิดข้อผิดพลาด"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new RaisedButton(
              color: Colors.blue,
              child: new Text("ตกลง", style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
    );
  }

  static void errorMessageDialog(String msg) {
    BuildContext context = navigatorKey.currentState.overlay.context;
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new RaisedButton(
              color: Colors.blue,
              child: new Text("ตกลง", style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
    );
  }

  static Future<bool> updateVersionDialog(String msg) {
    BuildContext context = navigatorKey.currentState.overlay.context;
    return showDialog(
        context: context,
        barrierDismissible:false,
        builder: (_) {
          return AlertDialog(
            title: Text(msg),
            actions: [
              new RaisedButton(
                color: Colors.blue,
                child: new Text("Ok", style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        }).then((exit) {
          return exit;
        }
    );
  }

  static Future<bool> requestTimeoutDialog(String msg) {
    BuildContext context = navigatorKey.currentState.overlay.context;
    return showDialog(
        context: context,
        barrierDismissible:false,
        builder: (_) {
          return AlertDialog(
            title: Text(msg),
            actions: [
              new RaisedButton(
                color: Colors.blue,
                child: new Text("ปิด", style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              new RaisedButton(
                color: Colors.blue,
                child: new Text("ลองใหม่", style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        }).then((exit) {
          return exit;
        }
    );
  }

  static Future<bool> askDialogMessage({String msg,String cancel,String submit}) {
    BuildContext context = navigatorKey.currentState.overlay.context;
    return showDialog(
        context: context,
        barrierDismissible:false,
        builder: (_) {
          return AlertDialog(
            title: Text(msg),
            actions: [
              new RaisedButton(
                color: Colors.blue,
                child: new Text(cancel, style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              new RaisedButton(
                color: Colors.blue,
                child: new Text(submit, style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        }).then((exit) {
      return exit;
    }
    );
  }

  static Future<bool> renameDialog({String msg,String cancel,String submit,Widget child}) {
    BuildContext context = navigatorKey.currentState.overlay.context;
    return showDialog(
        context: context,
        barrierDismissible:false,
        builder: (_) {
          return AlertDialog(
            content: child,
            title: Text(msg),
            actions: [
              new RaisedButton(
                color: Colors.blue,
                child: new Text(cancel, style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              new RaisedButton(
                color: Colors.blue,
                child: new Text(submit, style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        }).then((exit) {
      return exit;
    }
    );
  }
}
