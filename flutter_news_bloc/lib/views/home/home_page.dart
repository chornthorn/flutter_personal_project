import 'package:flutter/material.dart';
import 'package:news_app/utils/asset_util.dart';
import 'package:news_app/utils/index.dart';
import 'package:news_app/views/ui/genre.dart';
import 'package:news_app/views/widget/index.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.appName,
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            getSearchBarUI(context),
            Container(
              height: 250,
              child: Center(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: BookCard(
                        img: image1,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [
                    Color.fromRGBO(209, 2, 99, 1),
                    Theme.of(context).backgroundColor
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 60,
              child: Center(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          onTap: () {
                            MaterialPageRoute route = new MaterialPageRoute(builder: (context)=>Genre());
                            Navigator.push(
                              context,
                              route,
                            );
                          },
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10),
                              child: Text(
                                "Link title",
                                style: TextStyle(
                                  color:
                                  Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Trending!",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [
                    Color.fromRGBO(209, 2, 99, 1),
                    Theme.of(context).backgroundColor
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GridView.builder(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: SpotLight(
                    img: image1,
                    title: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour',
                  ),
                );
              },
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [
                    Color.fromRGBO(209, 2, 99, 1),
                    Theme.of(context).backgroundColor
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Breaking News",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: BookListItem(
                    img: image1,
                    title: 'Contrary to popular belief, Lorem Ipsum is not simply random text',
                    author:'bong thorn',
                    desc: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout'
                        .replaceAll(RegExp(r"<[^>]*>"), ''),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget getSearchBarUI(BuildContext context) {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final _txtSearch  = TextEditingController();

  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(38.0),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: const Offset(0, 2),
                      blurRadius: 8.0),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 3, bottom: 3),
                child: TextField(
                  controller: _txtSearch,
                  onChanged: (String txt) {},
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search News...',
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(38.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  offset: const Offset(0, 2),
                  blurRadius: 8.0),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(32.0),
              ),
              onTap: () {
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.search,
                    size: 25,
                    color: Theme.of(context).backgroundColor),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

