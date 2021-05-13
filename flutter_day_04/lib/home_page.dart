import 'package:flutter/material.dart';
import 'package:flutter_day_04/background.dart';
import 'package:flutter_day_04/common_utils.dart';
import 'package:flutter_day_04/constants.dart';
import 'package:flutter_day_04/foreground.dart';
import 'package:flutter_day_04/main_layout.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = Utils.contextHeight(context);
    double width = Utils.contextWidth(context);

    return MainLayout(
      background: Background(image: "bg1"),
      // foreground: Foreground(buildMainContent(),
      //   alignment: MainAxisAlignment.spaceEvenly,),
      foreground: buildMainContent(context),
    );
  }

  Widget buildMainContent(BuildContext context) {
    return [
      buildTitle(title: 'Hello', size: 18),
      buildTitle(title: 'Amanda', size: 20),
      buildTitle(
              title: 'How are you doing?',
              size: 28,
              textColor: AppColor.orange,
              fontWeight: FontWeight.bold)
          .box
          .margin(Vx.mOnly(top: 20))
          .make(),
      buildTitle(title: 'Daily Activity', size: 20)
          .box
          .margin(Vx.mOnly(top: 20, bottom: 10))
          .make(),
      buildActivityCard(context,
          value: '3680', category: 'steps', chartType: 'bar', logo: '1'),
      buildActivityCard(context,
          value: '90', category: 'bmp', chartType: 'wave', logo: '2'),
      buildActivityCard(context,
          value: '960', category: 'calories', chartType: 'bar', logo: '3'),
      // SizedBox(height: 40,),
      [
        buildPerformanceLabel(),
        VxBox().color(AppColor.disable).height(50).width(2).make(),
        buildRating()
      ].row(axisSize: MainAxisSize.max,
          alignment: MainAxisAlignment.spaceEvenly),
      SizedBox(height: 90,),
      [
        buildNav(Icons.home),
        buildNav(Icons.person),
        buildNav(Icons.timer),
        buildNav(Icons.notification_important),
        buildNav(Icons.settings),
      ].row(axisSize: MainAxisSize.max,
          alignment: MainAxisAlignment.center
      )
    ]
        .column(crossAlignment: CrossAxisAlignment.start)
        .box
        .margin(Vx.mOnly(top: 50, left: 30, right: 30))
        .make();
  }

  Widget buildNav(IconData data) {
    return Icon(data, color: AppColor.nav, size: 35,)
      .box.margin(Vx.mOnly(right: 20)).make();
  }

  Widget buildPerformanceLabel() {
    return [
        buildTitle(title: 'GOOD', size: 40, textColor: AppColor.orange),
        buildTitle(title: 'Performance',
            size: 15,)
      ].column(crossAlignment: CrossAxisAlignment.start);
  }

  Widget buildRating() {
    return [
        Icon(Icons.star, color: AppColor.orange,),
        Icon(Icons.star, color: AppColor.orange,),
        Icon(Icons.star, color: AppColor.orange,),
        Icon(Icons.star, color: AppColor.orange,),
        Icon(Icons.star, color: AppColor.disable,),
      ].row();
  }

  Widget buildActivityCard(BuildContext context,
      {String value, String category, String chartType, String logo}) {
    return VxBox(
            child: [
      Expanded(
          flex: 1,
          child: [
            buildTitle(
                title: value,
                size: 40,
                textColor: AppColor.orange,
                fontWeight: FontWeight.bold),
            buildTitle(
              title: category,
              size: 15,
              textColor: AppColor.grey,
            ),
          ].column(
              alignment: MainAxisAlignment.center,
              crossAlignment: CrossAxisAlignment.end)),
      Expanded(
          flex: 2,
          child: Image.asset(
            Utils.assetPath(chartType),
            // width: 100,
          ).box.padding(Vx.mSymmetric(v: 25, h: 25)).make()),
      Image.asset(
        Utils.assetPath('activity$logo'),
        width: 25,
      ).box.margin(Vx.mOnly(bottom: 30, right: 20)).make(),
    ]
                .row(
                  alignment: MainAxisAlignment.spaceEvenly,
                )
                .box
                .color(Colors.white)
                .height(100)
                .margin(Vx.mOnly(bottom: 30))
                .shadow
                .width(Utils.contextWidth(context))
                .withRounded(value: 30)
                .make())
        .make();
  }

  Widget buildTitle(
      {String title,
      double size,
      Color textColor: Colors.white,
      FontWeight fontWeight: FontWeight.normal}) {
    return title.text
        .color(textColor)
        .fontWeight(fontWeight)
        .minFontSize(size)
        .make();
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
