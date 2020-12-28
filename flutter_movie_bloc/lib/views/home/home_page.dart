import 'package:flutter/material.dart';
import 'package:my_movie/views/category/movie_category.dart';

import 'home_feature_row.dart';
import 'home_movie_scroll.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Image.asset("assets/icons/icon_nav_logo.png"),
                  pinned: true,
                  backgroundColor: Color(0xff26262d),
                  expandedHeight: MediaQuery.of(context).size.width * 0.6,
                  flexibleSpace: FlexibleSpaceBar(
                    background: HomeFeatureRow(),
                  ),
                ),
                SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return _buildRowView();
                    },
                    childCount: 5,
                  ),
                  itemExtent: 303,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowView() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: _ListSectionTitleView(),
        ),
        Container(
          height: 250,
          child: HomeMovieScrollRow(
            key: PageStorageKey(12),
          ),
        ),
        Container(
          height: 1,
          child: Divider(color: Colors.white24),
        )
      ],
    );
  }
}

class _ListSectionTitleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = MaterialButton(
      minWidth: 20,
      child: Image.asset("assets/icons/iconOverflow.png"),
      onPressed: () {
        MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => MovieCategoryPage(title: 'The man 2020'));
        Navigator.push(context, route);
      },
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 52,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Avengers: Endgame 2020',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: button,
          )
        ],
      ),
    );
  }
}
