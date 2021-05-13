import 'package:flutter/material.dart';
import 'package:flutter_day_04/common_utils.dart';
import 'package:flutter_day_04/constants.dart';
import 'package:flutter_day_04/sign_in_page.dart';
import "package:velocity_x/velocity_x.dart";

import 'activity_page.dart';
import 'home_page.dart';

/*
 * First, I setup
 *  - the assets
 *    - images
 *    - fonts
 *
 * Then, I add
 *  - constants for fonts and color
 *  - common_utils for some thing I need
 *
 * From now on, I decided to use a VelocityX package
 * in order to reduce the boilerplate code
 *
 * after writing first draft, I will refactor it
 *
 * time to code
 */

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: AppFont.barlow),
      home: SignInPage(),
      // home: HomePage(),
      // home: ActivityPage(),
    );
  }
}





















