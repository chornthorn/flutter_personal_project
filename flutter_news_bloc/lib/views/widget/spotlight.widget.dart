import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/ui/detail.dart';
import 'package:page_transition/page_transition.dart';

class SpotLight extends StatelessWidget {
  final String img;
  final String title;

  SpotLight({
    Key key,
    @required this.img,
    @required this.title,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: Details(
              imgTag: '12',
              titleTag: "Contrary to popular belief, Lorem Ipsum is not simply random text",
              authorTag: 'Bong Thorn',
            ),
          ),
        );

      },
      child: Container(
        width: 175.0,
        height: 280.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                height: 175.0,
                width: 280.0,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: "$img",
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Image.asset(
                            "assets/images/place.png",
                            fit: BoxFit.cover,
                            height: 175.0,
                            width: 175.0,
                          ),
                          fit: BoxFit.cover,
                          height: 175.0,
                          width: 175.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
              child: Text(
                "${title.replaceAll(r"\", "")}",
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
