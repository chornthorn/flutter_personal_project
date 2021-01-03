import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_movie/utils/index.dart';
import 'package:my_movie/utils/mock_data.dart';
import 'package:my_movie/views/home/home_movie_scroll.dart';
import 'package:my_movie/views/movies/movie_play.dart';
import 'package:my_movie/views/video_player/video_player.dart';
import 'package:my_movie/views/widets/video_player/video_player.dart';

class MoviePageArguments {
  static final routeName = "movies";
}

class MoviePage extends StatefulWidget {
  const MoviePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MoviePageState();
  }
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    var topImageHeight = MediaQuery.of(context).size.width * 0.7;
    final isPortraitMode =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: Color(0xff26262d),
      appBar: AppBar(
        backgroundColor: Color(0xff26262d),
        title: Text('Bahubali 2'),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: _buildImageView(context: context, height: topImageHeight),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                padding: EdgeInsets.only(
                  top: isPortraitMode ? (topImageHeight - 160) : 30,
                ),
                children: <Widget>[
                  _buildInfoRow(context),
                  _buildControlsRow(context),
                  _buildDescriptionRow(context),
                  Container(
                    child: _buildRelatedRow(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageView({BuildContext context, double height}) {
    return SizedBox(
      child: Stack(
        children: <Widget>[
          Container(
            height: height,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              imageUrl: image1,
              placeholder: (context, url) {
                return Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                    ),
                  ),
                );
              },
              fit: BoxFit.cover,
            ),
          ),
          SizedBox.expand(
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  stops: [0.5, 1.0],
                  colors: [
                    Colors.black38,
                    Color(0xff26262d),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 124,
                height: 180,
                child: CachedNetworkImage(
                  imageUrl: image1,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Khmer Movie',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(height: 30),
                    (2010 > 0
                        ? Text(
                            '(2010) · ${this._formatDuration(5)}\n Action ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          )
                        : Text('')),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _ratingText(),
          ),
        ],
      ),
    );
  }

  Widget _buildControlsRow(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(children: <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/icons/add_to_queue_normal.png",
                ),
              ),
            ),
            Text(
              'My Queue',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ]),
          SizedBox(
            width: 100,
            height: 100,
            child: IconButton(
              onPressed: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (context) => MoviePlay(
                          url: mockData["items"][1]["trailer_url"],
                        ));
                Navigator.push(context, route);
              },
              icon: Image.asset("assets/icons/play_large_normal.png"),
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/icons/share_normal.png"),
                ),
              ),
              Text(
                'Share',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Contrary to popular belief, Lorem Ipsum is not simply random text.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _ratingText() {
    //var value = ratings.first['value'] ?? '';
    return ClipRRect(
      borderRadius: BorderRadius.circular(2.0),
      child: Container(
        color: Color(0xff474747),
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Text(
            '3 star',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRelatedRow() {
    return Column(children: <Widget>[
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 16, top: 16),
          child: Text(
            'You May Also Like',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20),
        height: 270,
        child: HomeMovieScrollRow(
          key: UniqueKey(),
        ),
      ),
    ]);
//    return Padding(
//      padding: EdgeInsets.symmetric(vertical: 30.0),
//      child: Center(
//        child: Container(
//          width: 20,
//          height: 20,
//          child: CircularProgressIndicator(
//            valueColor: AlwaysStoppedAnimation<Color>(
//              Colors.grey,
//            ),
//          ),
//        ),
//      ),
//    );
  }

  _showAlertDialog(BuildContext context, {String title, String message}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(message),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  String _formatDuration(int seconds) {
    if (seconds == null) return '';
    if (seconds <= 60) {
      return '$seconds sec';
    }
    if (seconds <= 60 * 60) {
      return '${(seconds / 60).floor()} min';
    }
    return '${(seconds / 60 / 60).round()} h ${(seconds / 60 % 60).floor()} min';
  }
}
