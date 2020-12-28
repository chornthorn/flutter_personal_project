import 'package:flutter/material.dart';
import 'package:forsatbloc/utils/colors.dart';

class AppFooter extends StatefulWidget {

  AppFooter({@required this.activeIndex, @required this.onChangeIndex, @required this.menuList});
  final List<dynamic> menuList;
  final activeIndex;
  final Function onChangeIndex;

  @override
  _AppFooterState createState() => _AppFooterState();
}

class _AppFooterState extends State<AppFooter> {

  Color _color(index){
    if(widget.activeIndex == index) return Colors.white;
    else return themeColor;
  }

  Color _textColor(index){
    if(widget.activeIndex == index) return themeColor;
    else return HexColor("#747474");
  }

  double _iconSize(context){
    double size = (MediaQuery.of(context).size.width/60)*4.5;
    if(size > 60/2) size = 60/2.2;
    return size;
  }

  String _icon(ele, index){
    if(widget.activeIndex == index){
      return ele['menuIconActive'];
    }
    return ele['menuIcon'];
  }

  double _fontSize(context){
    double size = (MediaQuery.of(context).size.width/50)*1.5;
    if(size > 45/3.5) size = 60/4;
    return size;
  }

  String _slitTitle(String text){
    text = text.replaceAll('\n', '');
    return text.replaceAll('(', ' (');
  }

  void onChangeIndex(num index, String title){
    widget.onChangeIndex(index, title);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: new BottomAppBar(
          elevation: 0, // remove shadow of bottom tab
          child: Container(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1,  color: HexColor("#eeeeee")),
                )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.menuList.asMap().map((index, ele) =>
                    MapEntry(index,
                      Expanded(
                        child:GestureDetector(
                          onTap: (){onChangeIndex(index, _slitTitle(ele['menuTitle']));},
                          child: Container(
                            padding: EdgeInsets.only(left: 3, right: 3),
                            color: Theme.of(context).textTheme.body1.color,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
//                                Image.network(ele['menuIcon'], width: _iconSize(context), color: _textColor(index),),
                                Image.asset(_icon(ele, index), width: _iconSize(context),),
//                                Icon(Icons.home),
                                Text(ele['menuTitle'],
                                  style: TextStyle(fontSize:_fontSize(context), color: _textColor(index),),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                    ),
                ).values.toList()
            ),
          ),
        ),
    );
  }
}
