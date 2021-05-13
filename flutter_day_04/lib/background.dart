import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'common_utils.dart';

class Background extends StatelessWidget {
  Background({this.image: 'bg2'});

  final String image;
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Image.asset(
          Utils.assetPath(image),
          fit: BoxFit.fill,
        )).height(Utils.contextHeight(context)).make();
  }

}
