import 'package:flutter/material.dart';
import 'package:flutter_day_03/home_page.dart';
import 'package:flutter_day_03/schedule_page.dart';
import 'package:flutter_day_03/ticket_page.dart';

/*
First I setup
  - the assets fonts and images
  - a file for constants
    - colors
 */
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildMaterialApp();
  }

  MaterialApp buildMaterialApp() {
    return MaterialApp(
    title: 'Flutter Day 03',
    theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'OpenSans'),
      // home: HomePage(),
      // home: SchedulePage(),
      home: TicketPage(),
  );
  }
}