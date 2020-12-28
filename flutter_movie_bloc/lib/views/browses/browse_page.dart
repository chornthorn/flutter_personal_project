import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_movie/utils/asset_util.dart';
import 'package:my_movie/views/category/movie_category.dart';

class BrowsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              title: Text("Browse"),
              pinned: true,
              backgroundColor: Color(0xff26262d)),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildListItem(
                  context: context,
                );
              },
              childCount: 10,
            ),
            itemExtent: 70,
          ),
        ],
      ),
    );
  }

  Widget _buildListItem({BuildContext context}) {
    return InkWell(
      onTap: () {
        MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => MovieCategoryPage(title: 'The man 2020'));
        Navigator.push(context, route);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
        margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
        child: Container(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 180,
                  child: CachedNetworkImage(
                    imageUrl: image2 ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.transparent, Colors.grey],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'The man 2020',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
