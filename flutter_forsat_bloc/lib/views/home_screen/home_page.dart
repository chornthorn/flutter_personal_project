import 'package:flutter/material.dart';
import 'package:forsatbloc/views/account_screen/index.dart';
import 'package:forsatbloc/views/favorite_screen/favorities_page.dart';
import 'package:forsatbloc/views/forum_screen/forum_page.dart';
import 'package:forsatbloc/views/opportunity_screen/index.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [
    OpportunitiesScreen(),
    QuestionScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];

  PageController _pageController = PageController();

  void onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  int _selectedIndex = 0;

  void _onPageChanged(int pageIndex) {
    setState(() {
      _selectedIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        onTap: onItemTapped,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0
                  ? Theme.of(context).accentColor
                  : Colors.grey,
            ),
            title: Text(
              'Opportunities',
              style: TextStyle(
                color: _selectedIndex == 0
                    ? Theme.of(context).accentColor
                    : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: _selectedIndex == 1
                  ? Theme.of(context).accentColor
                  : Colors.grey,
            ),
            title: Text(
              'Forum',
              style: TextStyle(
                color: _selectedIndex == 1
                    ? Theme.of(context).accentColor
                    : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: _selectedIndex == 2
                  ? Theme.of(context).accentColor
                  : Colors.grey,
            ),
            title: Text(
              'Favorite',
              style: TextStyle(
                color: _selectedIndex == 2
                    ? Theme.of(context).accentColor
                    : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: _selectedIndex == 3
                  ? Theme.of(context).accentColor
                  : Colors.grey,
            ),
            title: Text(
              'Account',
              style: TextStyle(
                color: _selectedIndex == 3
                    ? Theme.of(context).accentColor
                    : Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        children: _screens,
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: _onPageChanged,
      ),
    );
  }
}
