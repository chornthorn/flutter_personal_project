import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/utils/index.dart';
import 'package:news_app/views/widget/index.dart';

class Genre extends StatefulWidget{

  @override
  _GenreState createState() => _GenreState();
}

class _GenreState extends State<Genre> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Contrary to popular belief, Lorem Ipsum is not simply random text"),
      ),
      body:ListView(
        children: <Widget>[
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: BookListItem(
                  img: image1,
                  title: 'Contrary to popular belief, Lorem Ipsum is not simply random text',
                  author: 'Bong Thorn',
                  desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries".replaceAll(RegExp(r"<[^>]*>"), ''),
                ),
              );
            },
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}