import 'package:flutter/material.dart';
import 'package:flutter_day_04/background.dart';
import 'package:flutter_day_04/common_utils.dart';
import 'package:flutter_day_04/constants.dart';
import 'package:flutter_day_04/foreground.dart';
import 'package:flutter_day_04/main_layout.dart';
import 'package:velocity_x/velocity_x.dart';

// time to refactor ***
// everything seems to normal
// time to build another page
class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      background: Background(),
      foreground: Foreground(buildMainContent()),
    );
  }

  List<Widget> buildMainContent() {
    return [
      VxBox(child: Image.asset(Utils.assetPath('logo')))
          .height(200)
          .width(200)
          .make(),
      VxBox(child: Image.asset(Utils.assetPath('logo-text')))
          .height(100)
          .width(150)
          .make(),
      SizedBox(
        height: 150,
      ),
      buildButton(title: 'Sign Up', color: AppColor.orange),
      buildButton(title: 'Sign Up', color: AppColor.darkPink),
    ];
  }

  Widget buildButton({String title, Color color}) {
    return title.text
        .fontWeight(FontWeight.bold)
        .color(Colors.white)
        .size(20)
        .make()
        .centered()
        .box
        .color(color)
        .height(50)
        .width(140)
        .margin(Vx.mOnly(bottom: 20))
        .withRounded(value: 25)
        .make();
  }
}
