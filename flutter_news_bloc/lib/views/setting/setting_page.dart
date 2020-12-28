import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/index.dart';
import 'package:news_app/views/index.dart';
import 'package:news_app/views/widget/index.dart';
import 'package:page_transition/page_transition.dart';

class SettingPage extends StatelessWidget {
  static String isLogin;
  List items = [
    {
      "icon": Icons.favorite,
      "title": "Favorites",
      "page": FavoritePage(),
    },
    {"icon": Icons.brightness_6, "title": "Dark Mode"},
    {
      "icon": Icons.info,
      "title": "About",
      "page": About(),
    },
    {
      "icon": Icons.priority_high,
      "title": "Privacy Policy",
      "page": Privacy(),
    },
    {
      "icon": Icons.exit_to_app,
      "title": "Logout",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Page'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: ()=>exitDialog(context),),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: new Stack(fit: StackFit.loose, children: <Widget>[
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      width: 140.0,
                      height: 140.0,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl:image1 ,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Image.asset(
                            "assets/images/user.png",
                            fit: BoxFit.cover,
                            height: 140.0,
                            width: 140.0,
                          ),
                          fit: BoxFit.cover,
                          height: 140.0,
                          width: 140.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top: 90.0, right: 100.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 25.0,
                          child: new Icon(
                             Icons.lock_outline,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
              ]),
            ),
            Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Text(
                          'Hi! Bong Thorn',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                )),
            ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                if (items[index]['title'] == "Dark Mode") {
                  return SwitchListTile(
                    secondary: Icon(
                      items[index]['icon'],
                    ),
                    title: Text(
                      items[index]['title'],
                    ),
                    value: true,
                    onChanged: (v) {

                    },
                  );
                }
                if (items[index]['title'] == "Logout" ||
                    items[index]['title'] == "LogIn") {
                  items[index]['title'] = isLogin == "1" ? "LogIn" : "Logout";
                }
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: items[index]['page'],
                      ),
                    );
                  },
                  leading: Icon(
                    items[index]['icon'],
                  ),
                  title: Text(
                    items[index]['title'],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
          ],
        ),
      ),
    );
  }
  exitDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 15),
              Text(
                Constants.appName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              SizedBox(height: 25),

              Text(
                "Do you really want to quit?",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Container(
                    height: 40,
                    width: 130,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: ()=> exit(0),
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 130,
                    child: OutlineButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      borderSide: BorderSide(color: Theme.of(context).accentColor),
                      child: Text(
                        "No",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: ()=>Navigator.pop(context),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
