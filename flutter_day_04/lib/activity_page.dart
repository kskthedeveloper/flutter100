import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_day_04/background.dart';
import 'package:flutter_day_04/common_utils.dart';
import 'package:flutter_day_04/constants.dart';
import 'package:flutter_day_04/foreground.dart';
import 'package:flutter_day_04/main_layout.dart';
import 'package:velocity_x/velocity_x.dart';

class ActivityPage extends StatelessWidget {
  BoxShadow shadow = BoxShadow(
      color: Color(0x44000000),
      spreadRadius: 3,
      blurRadius: 5,
      offset: Offset(2, 3));

  BoxShadow disableShadow = BoxShadow(
      color: Color(0x00000000),
      spreadRadius: 3,
      blurRadius: 5,
      offset: Offset(2, 3));

  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {

    return MainLayout(
      background: VxBox()
          .color(AppColor.background)
          .height(Utils.contextHeight(context))
          .make(),
      foreground: buildMainContent(context),
    );
  }

  Widget buildMainContent(BuildContext context) {
    return [
      ...buildWeeklyActivity(),
      SizedBox(
        height: 20,
      ),
      ...buildWeeklyPoints(context),
      SizedBox(
        height: 50,
      ),
      ...buildActivityRecords(),
      buildFloatingButton()
    ]
        .column(crossAlignment: CrossAxisAlignment.start)
        .box
        .margin(Vx.mOnly(top: 70, left: 30, right: 30))
        .make();
  }

  Widget buildFloatingButton() {
    return VxBox(
      child: Icon(
          Icons.add_sharp, size: 40, color: Colors.white,)
    ).color(AppColor.orange).height(70).width(70)
        .withRounded(value: 35)
        .withShadow([shadow])
        .make()
        .centered();
  }

  List<Widget> buildWeeklyActivity() {
    return [
      buildTitle(
          title: "Weekly Activity",
          size: 25,
          textColor: AppColor.orange,
          fontWeight: FontWeight.bold),
      SizedBox(
        height: 20,
      ),
      [
        ...days.map((day) {
          var date = days.indexOf(day);
          return buildDayColumn(
              day: day, date: '${date + 8}', isActive: date == 4);
        }).toList()
      ].row()
    ];
  }

  List<Widget> buildWeeklyPoints(BuildContext context) {
    return [
      buildTitle(
          title: "Weekly Points",
          size: 25,
          textColor: AppColor.orange,
          fontWeight: FontWeight.bold),
      [
        VxBox()
            .color(AppColor.disable)
            .height(8)
            .width(Utils.contextWidth(context))
            .withRounded(value: 5)
            .make(),
        VxBox()
            .color(AppColor.orange)
            .height(8)
            .width(280)
            .withRounded(value: 5)
            .make(),
      ].stack().box.margin(Vx.mOnly(top: 15, bottom: 5)).make(),
      [
        buildTitle(title: '1780 pts', size: 13, textColor: AppColor.orange),
        buildTitle(title: '2000 pts', size: 13, textColor: AppColor.disable)
      ].row(
          axisSize: MainAxisSize.max,
          alignment: MainAxisAlignment.spaceBetween),
    ];
  }

  List<Widget> buildActivityRecords() {
    return [
      buildActivityRecord(
          title: "Running", value: "30 ", unit: "min", logo: '1'),
      buildActivityRecord(
          title: "Ball Exercise", value: "15 x", unit: "", logo: '2'),
      buildActivityRecord(
          title: "Planking", value: "5 ", unit: "min", logo: '3'),
      buildActivityRecord(
          title: "Push up", value: "20 x", unit: "min", logo: '4'),
    ];
  }

  Widget buildActivityRecord({
    String title,
    String value,
    String unit,
    String logo,
  }) {
    return [
      Image.asset(
        Utils.assetPath('ex$logo'),
      )
          .box
          .color(Color(0xddffffff))
          .width(70)
          .padding(Vx.mOnly(right: 8))
          .height(70)
          .withRounded(value: 20)
          .make(),
      SizedBox(width: 20,),
      Expanded(
        flex: 2,
        child: [
          buildTitle(title: title, size: 20, textColor: AppColor.nav),
          [
            buildTitle(title: value, size: 30, textColor: AppColor.orange),
            buildTitle(title: unit, size: 15, textColor: AppColor.nav)
                .box
                .margin(Vx.mOnly(bottom: 5))
                .make(),
          ].row(crossAlignment: CrossAxisAlignment.end)
        ].column(crossAlignment: CrossAxisAlignment.start),
      ),
      [
        buildIcon(Icons.timer),
        buildIcon(Icons.bookmark),
        buildIcon(Icons.star),
      ].row()
    ].row(
        axisSize: MainAxisSize.max,
        alignment: MainAxisAlignment.spaceBetween)
        .box
        .margin(Vx.mOnly(bottom: 30))
        .make();
  }

  Widget buildIcon(IconData data) {
    return Icon(
      data,
      size: 30,
      color: AppColor.nav,
    ).box.margin(Vx.mOnly(left: 5, right: 5)).make();
  }

  Widget buildDayColumn({String day, String date, bool isActive: false}) {
    Color textColor = isActive ? Colors.white : AppColor.disable;
    Color boxColor = isActive ? AppColor.orange : Colors.transparent;

    return [
      buildTitle(title: day, size: 15, textColor: textColor),
      buildTitle(title: date, size: 20, textColor: textColor),
    ]
        .column(alignment: MainAxisAlignment.spaceEvenly)
        .box
        .withShadow(isActive ? [shadow] : [disableShadow])
        .withRounded(value: 10)
        .color(boxColor)
        .padding(Vx.mOnly(left: 10, right: 10, top: 5, bottom: 5))
        .height(60)
        .make();
  }

  Widget buildNav(IconData data) {
    return Icon(
      data,
      color: AppColor.nav,
      size: 35,
    ).box.margin(Vx.mOnly(right: 20)).make();
  }

  Widget buildPerformanceLabel() {
    return [
      buildTitle(title: 'GOOD', size: 40, textColor: AppColor.orange),
      buildTitle(
        title: 'Performance',
        size: 15,
      )
    ].column(crossAlignment: CrossAxisAlignment.start);
  }

  Widget buildRating() {
    return [
      Icon(
        Icons.star,
        color: AppColor.orange,
      ),
      Icon(
        Icons.star,
        color: AppColor.orange,
      ),
      Icon(
        Icons.star,
        color: AppColor.orange,
      ),
      Icon(
        Icons.star,
        color: AppColor.orange,
      ),
      Icon(
        Icons.star,
        color: AppColor.disable,
      ),
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
