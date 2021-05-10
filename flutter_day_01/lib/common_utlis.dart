import 'package:flutter/material.dart';

class CommonUtils {
  static List<BoxShadow> getBoxShadow({Color color: Colors.black12}) {
    return [
        BoxShadow(
          color: color,
          blurRadius: 15.0,
          spreadRadius: 1.0,
          offset: Offset(
            3.0,
            3.0,
          ),
        )
      ];
  }

  static getBoxDecoration({double radius: 10, List<BoxShadow> boxShadow: const [], Color color: Colors.white}) {
    return  BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: color, //background color of box
      boxShadow: boxShadow,
    );
  }

}