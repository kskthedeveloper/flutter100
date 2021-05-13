import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MainLayout extends StatelessWidget {
  MainLayout({this.background, this.foreground});

  final Widget background;
  final Widget foreground;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: [
      background,
      foreground,
    ].stack());
  }
}
