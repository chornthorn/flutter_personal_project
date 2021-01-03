import 'package:flutter/material.dart';
import 'package:my_movie/views/widets/video_player/video_player.dart';

class MoviePlay extends StatelessWidget {
  final String url;

  const MoviePlay({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: size.orientation == Orientation.portrait
          ? AppBar(
              title: Text('Movie Name here'),
              backgroundColor: Colors.black,
            )
          : null,
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: VideoPlayer(url: url),
            ),
          ],
        ),
      ),
    );
  }
}
