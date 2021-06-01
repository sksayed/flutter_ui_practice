import 'package:flutter/material.dart';
import 'package:flutter_ui_learning/utils/theme_and_color_constant.dart';
import 'package:flutter_ui_learning/utils/widget_utils.dart';

class OptionButton extends StatelessWidget {
  final String text;

  final IconData icon;

  final double width;

  const OptionButton(
      {Key? key, required this.text, required this.icon, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      child: FlatButton(
        color: COLOR_DARK_BLUE,
        splashColor: Colors.white.withAlpha(55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(this.icon, color: Colors.white),
            getHorizontalSpace(width: 10),
            Text(
              this.text,
              style: TextStyle(color: Colors.white),
            ),
          ],//end of
        ),
      ),
    );
  }
}
