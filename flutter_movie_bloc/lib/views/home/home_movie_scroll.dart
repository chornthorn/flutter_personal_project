import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_movie/utils/index.dart';
import 'package:my_movie/views/movies/movie_page.dart';

class HomeMovieScrollRow extends StatelessWidget {
  const HomeMovieScrollRow({@required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        key: key,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 6.0),
            child: GestureDetector(
              child: _ScrollItemView(),
              onTap: () {
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (context) => MoviePage());
                Navigator.push(context, route);
              },
            ),
          );
        },
        padding: EdgeInsets.only(left: 16.0),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}

class _ScrollItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            placeholder: (context, url) {
              return AspectRatio(
                aspectRatio: 0.68,
                child: Image.asset(
                  "assets/icons/placeholder.png",
                  fit: BoxFit.cover,
                ),
              );
            },
            imageUrl: image2,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 14),
          Text(
            'Baahubali 2',
            maxLines: 2,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
