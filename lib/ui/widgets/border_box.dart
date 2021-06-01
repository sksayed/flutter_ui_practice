import 'package:flutter/material.dart';
import 'package:flutter_ui_learning/utils/theme_and_color_constant.dart'
    as theme;

class BorderBox extends StatelessWidget {
  final Widget child;

  final double width, height;

  final EdgeInsets? padding;

  const BorderBox(
      {Key? key,
      this.width = 0,
      this.height = 0,
      this.padding = null,
      required this.child}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: theme.COLOR_WHITE,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: theme.COLOR_GREY.withAlpha(40), width: 2)),
      padding: this.padding ?? const EdgeInsets.all(8.0),
      child: Center(
        child: this.child,
      ),
    );
  }
}
