import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_movie/utils/asset_util.dart';
import 'package:my_movie/views/movies/movie_page.dart';

class MovieCategoryPage extends StatefulWidget {
  final String title;
  final bool showAppBar;

  const MovieCategoryPage({Key key, this.title, this.showAppBar})
      : super(key: key);

  @override
  _MovieCategoryPageState createState() => _MovieCategoryPageState();
}

class _MovieCategoryPageState extends State<MovieCategoryPage> {
  @override
  Widget build(BuildContext context) {
    final itemWidth =
        (MediaQuery.of(context).size.width - 2 * 16 - 8 * 2) / 3.0;
    final itemHeight = itemWidth * 1.46 + 80.0;
    final showAppBar = widget.showAppBar ?? true;
    return Scaffold(
      body: Container(
        color: Color(0xff26262d),
        child: Container(
          child: CustomScrollView(slivers: <Widget>[
            showAppBar
                ? SliverAppBar(
                    title: Text(widget.title),
                    pinned: true,
                    backgroundColor: Color(0xff26262d))
                : SliverAppBar(),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return _buildGridItem(context);
                  },
                  childCount: 20,
                ),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: itemWidth,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 8,
                  childAspectRatio: itemWidth / itemHeight,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context) {
    return InkWell(
      onTap: () {
        MaterialPageRoute route =
            MaterialPageRoute(builder: (context) => MoviePage());
        Navigator.push(context, route);
      },
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 0.68,
              child: CachedNetworkImage(
                placeholder: (context, url) {
                  return Image.asset("assets/icons/placeholder.png");
                },
                imageUrl: image1,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 14),
            Text(
              'The man 2020',
              maxLines: 2,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
