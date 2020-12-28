import 'package:cuby_ebook/utils/colors.gen.dart';
import 'package:flutter/material.dart';

class TFCustom extends StatelessWidget {
  final String label, hintText;
  final IconData icon;
  final TextEditingController controller;

  final bool isPassword;
  final FocusNode focusNode;
  final VoidCallback onClickShow;
  final bool isShow;
  final bool isValidate;
  final ValueChanged<String> onChanged;

  const TFCustom({
    Key key,
    this.label,
    this.hintText,
    this.icon,
    this.controller,
    this.isPassword = false,
    this.focusNode,
    this.onClickShow,
    this.isShow = false,
    this.isValidate = false,
    this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(
          width: isValidate ? 1.5 : 1,
          color: isValidate ? ColorName.primary : ColorName.grey,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(
                          icon,
                          color:
                              isValidate ? ColorName.primary : ColorName.grey,
                        ),
                        SizedBox(width: 5),
                        Text(label),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: controller,
                    focusNode: focusNode,
                    obscureText: !isShow ? isPassword : false,
                    obscuringCharacter: "*",
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      hintText: hintText,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: ColorName.grey,
                        fontWeight: FontWeight.w300,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      isDense: true,
                    ),
                  ),
                ],
              ),
            ),
            isPassword
                ? Container(
                    child: IconButton(
                      icon: Icon(
                        isShow
                            ? Icons.remove_red_eye_sharp
                            : Icons.remove_red_eye_outlined,
                        color: ColorName.grey,
                      ),
                      onPressed: onClickShow,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
