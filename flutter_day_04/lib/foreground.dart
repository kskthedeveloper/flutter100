import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'common_utils.dart';

class Foreground extends StatelessWidget {
  Foreground(this.content,
      {this.alignment: MainAxisAlignment.center});

  final List<Widget> content;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    double height = Utils.contextHeight(context);
    double width = Utils.contextWidth(context);

    return content
        .column(alignment: alignment)
        .box
        .height(height)
        .width(width)
        .make();
  }
}
