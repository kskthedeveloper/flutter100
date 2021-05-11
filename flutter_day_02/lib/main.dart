import 'package:flutter/material.dart';

import 'course_page.dart';
import 'home_page.dart';
import 'lesson_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, fontFamily: 'SF Pro Display Regular'),
      home: HomePage(),
      // home: CoursePage(),
      // home: LessonPage(),
    );
  }
}
