import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_movie/utils/index.dart';
import 'package:my_movie/views/movies/movie_page.dart';

class HomeFeatureRow extends StatefulWidget {
  @override
  _HomeFeatureRowState createState() => _HomeFeatureRowState();
}

class _HomeFeatureRowState extends State<HomeFeatureRow>
    with AutomaticKeepAliveClientMixin<HomeFeatureRow> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var pageController = PageController(initialPage: _currentPage);

    var pageView = PageView.builder(
      key: PageStorageKey(context),
      itemCount: 5,
      controller: pageController,
      itemBuilder: (context, index) {
        return _PageItemView(
          totalPage: 5,
          currentPage: index,
        );
      },
      onPageChanged: (page) {
        setState(() {
          this._currentPage = page;
        });
      },
    );

    return Container(child: pageView);
  }

  @override
  bool get wantKeepAlive => true;
}

class _PageItemView extends StatelessWidget {
  final int totalPage;
  final int currentPage;

  const _PageItemView(
      {Key key, @required this.totalPage, @required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MaterialPageRoute route =
            MaterialPageRoute(builder: (context) => MoviePage());
        Navigator.push(context, route);
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CachedNetworkImage(
              imageUrl: image1,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Avengers: Endgame 2020",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RichText(
                      text: TextSpan(
                        text: '${currentPage + 1}',
                        style:
                            TextStyle(color: Color(0xffee5c32), fontSize: 12),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' / $totalPage',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
