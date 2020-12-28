import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsatbloc/blocs/bottom_app_bar/bottom_navigation_bar_bloc.dart';
import 'package:forsatbloc/blocs/opportunity/bloc.dart';
import 'package:forsatbloc/views/account_screen/index.dart';
import 'package:forsatbloc/views/favorite_screen/favorities_page.dart';
import 'package:forsatbloc/views/forum_screen/forum_page.dart';
import 'package:forsatbloc/views/opportunity_screen/index.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final screens = <Widget>[
    OpportunitiesScreen(),
    QuestionScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
      builder: (context, state) {
        if (state is HomeState) {
          return buildActivePage(currentIndex: state.index);
        }
        if (state is ForumState) {
          return buildActivePage(currentIndex: state.index);
        }
        if (state is FavoriteState) {
          return buildActivePage(currentIndex: state.index);
        }
        if (state is AccountState) {
          return buildActivePage(currentIndex: state.index);
        }
        return Scaffold();
      },
    );
  }

  Scaffold buildActivePage({int currentIndex}) {
    return Scaffold(
      key: _scaffoldKey,
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
        elevation: 5,
        onTap: (index) {
          if (index == 0) {
            BlocProvider.of<BottomNavigationBarBloc>(context)
              ..add(LoadHome());
            BlocProvider.of<OpportunityBloc>(context)
              ..add(LoadOpportunity());
          }
          if (index == 1) {
            return BlocProvider.of<BottomNavigationBarBloc>(context)
              ..add(LoadForum());
          }
          if (index == 2) {
            return BlocProvider.of<BottomNavigationBarBloc>(context)
              ..add(LoadFavorite());
          }
          if (index == 3) {
            return BlocProvider.of<BottomNavigationBarBloc>(context)
              ..add(LoadAccount());
          }

          return BlocProvider.of<BottomNavigationBarBloc>(context)
            ..add(LoadHome());
        },
        items: [
          _buildTabBarItem(icon: Icon(Icons.home), label: 'Home'),
          _buildTabBarItem(icon: Icon(Icons.chat), label: 'Forum'),
          _buildTabBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          _buildTabBarItem(icon: Icon(Icons.account_circle), label: 'Account')
        ],
      ),
    );
  }

  _buildTabBarItem({final Widget icon, final String label}) {
    return BottomNavigationBarItem(
      icon: icon,
      title: Text(
        label,
        style: TextStyle(fontSize: 14.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}