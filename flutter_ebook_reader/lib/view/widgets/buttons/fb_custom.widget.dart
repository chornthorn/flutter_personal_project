import 'package:cuby_ebook/utils/colors.gen.dart';
import 'package:flutter/material.dart';

class FBCustom extends StatelessWidget {
  final String label;
  final bool hasColor;
  final VoidCallback onPressed;
  const FBCustom({
    Key key,
    this.label,
    this.onPressed,
    this.hasColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: hasColor ? ColorName.primary : ColorName.grey,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: FlatButton(
        padding: EdgeInsets.zero,
        color: hasColor ? ColorName.primary : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: hasColor ? Colors.white : ColorName.dark,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
