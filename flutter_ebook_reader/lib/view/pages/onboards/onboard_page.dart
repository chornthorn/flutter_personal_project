import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'onboard.dart';

class OnBoardPage extends StatelessWidget {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Provider<OnBoardState>(
      create: (_) => OnBoardState(),
      child: Scaffold(
        body: OnBoard(
          pageController: _pageController,
          onSkip: () {
            Navigator.pushNamed(context, '/sign_in');
          },
          onDone: () {
            print('done tapped');
          },
          onBoardData: onBoardData,
          titleStyles: TextStyle(
            color: Colors.deepOrange,
            fontSize: 18,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.15,
          ),
          descriptionStyles: TextStyle(
            fontSize: 16,
            color: Colors.brown.shade300,
          ),
          pageIndicatorStyle: PageIndicatorStyle(
            width: 100,
            inactiveColor: Colors.deepOrangeAccent,
            activeColor: Colors.deepOrange,
            inactiveSize: Size(8, 8),
            activeSize: Size(12, 12),
          ),
          skipButton: FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onPressed: () {
              Navigator.pushNamed(context, '/sign_in');
            },
            child: Text(
              "Skip",
              style: TextStyle(color: Colors.deepOrangeAccent),
            ),
          ),
          nextButton: Consumer<OnBoardState>(
            builder: (BuildContext context, OnBoardState state, Widget child) {
              return InkWell(
                onTap: () => _onNextTap(state, context),
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: 230,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [Colors.redAccent, Colors.deepOrangeAccent],
                    ),
                  ),
                  child: Text(
                    state.isLastPage ? "Get Started" : "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState, BuildContext context) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      Navigator.pushNamed(context, '/sign_in');
    }
  }
}

final List<OnBoardModel> onBoardData = [
  OnBoardModel(
    title: "Easy Books Reading",
    description:
        "You can read a book with your phone, and you can read it everywhere.",
    imgUrl: "assets/images/smart-watch-connected-with-mobile.png",
  ),
  OnBoardModel(
    title: "Offline Reading",
    description:
        "You can download and buy the e-book. Downloaded e-book can read in offline mode",
    imgUrl: 'assets/images/social-media-notifications.png',
  ),
  OnBoardModel(
    title: "Always Updated",
    description:
        "The e-book stocks is will always be updated and you will get lifetime support update.",
    imgUrl: 'assets/images/youtube-settings.png',
  ),
];
