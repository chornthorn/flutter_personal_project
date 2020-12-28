import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/bloc/index.dart';
import 'package:my_movie/views/index.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screens = <Widget>[
    HomePage(),
    BrowsePage(),
    SearchPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ProxyAnimation transitionAnimation =
      ProxyAnimation(kAlwaysDismissedAnimation);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomAppBarBloc, BottomAppBarState>(
      builder: (context, state) {
        if (state is HomeState) {
          return buildHomepage(currentIndex: state.index);
        }
        if (state is ForumState) {
          return buildHomepage(currentIndex: state.index);
        }
        if (state is FavoriteState) {
          return buildHomepage(currentIndex: state.index);
        }
        return Container(
          color: Colors.red,
        );
      },
    );
  }

  Scaffold buildHomepage({int currentIndex}) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: PageStorage(
              bucket: bucket,
              child: screens[currentIndex],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey[500],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xffee5c32),
        elevation: 5,
        onTap: (index) {
          if (index == 0) {
            return BlocProvider.of<BottomAppBarBloc>(context)..add(LoadHome());
          }
          if (index == 1) {
            return BlocProvider.of<BottomAppBarBloc>(context)..add(LoadForum());
          }
          if (index == 2) {
            return BlocProvider.of<BottomAppBarBloc>(context)
              ..add(LoadFavorite());
          }

          return BlocProvider.of<BottomAppBarBloc>(context)..add(LoadHome());
        },
        items: [
          _buildTabBarItem(icon: Icon(Icons.home), label: 'Home'),
          _buildTabBarItem(icon: Icon(Icons.live_tv), label: 'Browse'),
          _buildTabBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }

  _buildTabBarItem({final Widget icon, final String label}) {
    return BottomNavigationBarItem(
      backgroundColor: Theme.of(context).primaryColorDark,
      icon: icon,
      title: Text(
        label,
        style: TextStyle(fontSize: 14.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
