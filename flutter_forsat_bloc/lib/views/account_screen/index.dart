import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsatbloc/blocs/authentication/authentication.dart';
import 'package:forsatbloc/routes/route_constants.dart';
import 'package:forsatbloc/views/home_screen/index.dart';
import 'package:forsatbloc/views/setting/setting.dart';
import 'package:forsatbloc/views/setting/theme_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Future<Null> signOutProcess() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
//    exit(0);
     Navigator.pushNamedAndRemoveUntil(context, signInRoute, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Page'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => backToLoginPage(),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SettingScreen(),
            )),
          ),
          IconButton(
            icon: Icon(Icons.apps),
            onPressed: () {
              // Navigate to the PreferencePage
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PreferencePage(),
              ));
            },
          )
        ],
      ),
    );
  }
  backToLoginPage() async {
    /* return new Future.delayed(const Duration(seconds: 1), () {
      return Navigator.pop(context);
    });*/
    BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());

  }
}
