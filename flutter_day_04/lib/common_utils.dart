import 'package:flutter/material.dart';

class Utils {
  static double contextHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double contextWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static String assetPath(String file) => 'assets/images/$file.png';
}