import 'package:flutter/material.dart';
import 'circle_progress.dart';
import 'common_utlis.dart';
import 'common_widgets.dart';
import 'constants.dart';

class HomePage extends StatelessWidget {
  String asset = Path.asset;

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.backgroundColor,
      leading: Container(
        margin: EdgeInsets.only(left: 30),
        child: Image.asset(
          '${asset}leading1.png',
        ),
      ),
      leadingWidth: 50,
      actions: [
        Container(
          height: 40,
          width: 40,
          child: Image.asset(
            '${asset}english.png',
          ),
        ),
        CommonWidget.widthBox(10),
        Container(
          child: Row(
            children: [
              Text(
                'English',
                style: TextStyle(color: AppColor.textColorDark),
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColor.textColorDark,
              )
            ],
          ),
        ),
        SizedBox(
          width: 30.0,
        )
      ],
      elevation: 0,
    );
  }

  Widget buildMain(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColor.backgroundColor,
      child: ListView(
        children: [
          buildProfileRow(),
          buildTitleRow(),
          buildChallengeCard(),
          buildCourseTitleRow(),
          buildCourseRow(context)
        ],
      ),
    );
  }

  Container buildCourseRow(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(top: 15),
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            padding: EdgeInsets.only(bottom: 20, top: 10),
            scrollDirection: Axis.horizontal,
            children: [
              buildCourseCard(
                  title: 'Spanish',
                  level: 'Beginner',
                  percentage: 43,
                  isFirstOne: true),
              buildCourseCard(
                  title: 'Italian',
                  level: 'Advanced',
                  percentage: 16,
                  bgColor: AppColor.green),
              buildCourseCard(
                  title: 'Germany',
                  level: 'Intermediate',
                  percentage: 43,
                  bgColor: AppColor.blue),
            ],
          ),
        );
  }

  Container buildCourseCard(
      {String title,
      String level,
      int percentage,
      bool isFirstOne: false,
      Color bgColor: AppColor.orange}) {
    return Container(
      margin: isFirstOne
          ? EdgeInsets.only(left: 30, right: 20)
          : EdgeInsets.only(right: 20),
      width: 200,
      decoration: CommonUtils.getBoxDecoration(
          radius: 25,
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowGray,
              blurRadius: 8.0,
              spreadRadius: 2,
              offset: Offset(
                0.0,
                3.0,
              ),
            )
          ]),
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontFamily: AppFont.poppins,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: AppColor.paleWhite),
            ),
            Text(
              level,
              style: TextStyle(
                  fontFamily: AppFont.karla,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: AppColor.paleWhite),
            ),
            CommonWidget.heightBox(15),
            Container(
              margin: EdgeInsets.only(left: 110),
              height: 60,
              width: 60,
              child: CustomPaint(
                foregroundPainter: CircleProgress(percentage.toDouble()),
                child: Center(
                  child: Text(
                    '$percentage%',
                      style: TextStyle(
                          fontFamily: AppFont.poppins,
                          fontSize: 15,
                          color: Colors.white)
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }

  Widget buildTitleRow() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 15, bottom: 10),
      child: Text(
        'Welcome back!',
        style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            fontSize: 35,
            color: AppColor.textColorDark),
      ),
    );
  }

  Widget buildProfileRow() {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(left: 30, right: 20),
              height: 60,
              width: 60,
              decoration: CommonUtils.getBoxDecoration(
                  radius: 25,
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.purple,
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                      offset: Offset(
                        0.0,
                        1.0,
                      ),
                    )
                  ])),
          Expanded(
            flex: 2,
            child: Container(
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Martha Stewart',
                    style: TextStyle(
                        fontFamily: "Karla",
                        fontWeight: FontWeight.w300,
                        fontSize: 18),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        '${asset}marker.png',
                        scale: 3,
                      ),
                      CommonWidget.widthBox(10),
                      Text(
                        'United Kingdom',
                        style: TextStyle(
                            color: AppColor.textColorGrey,
                            fontFamily: AppFont.karla,
                            fontWeight: FontWeight.w300,
                            fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildChallengeCard() {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 10),
      height: 230,
      width: 335,
      decoration: CommonUtils.getBoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColor.purple,
          blurRadius: 10.0,
          spreadRadius: 0.5,
          offset: Offset(
            0.0,
            5.0,
          ),
        )
      ]
      ),
      child: Container(
        child: Stack(
          children: [
            Positioned(
              bottom: -69,
              right: -63,
              child: Image.asset(
                '${asset}card-bg.png',
                fit: BoxFit.cover,
                height: 300,
                width: 223,
              ),
            ),
            Container(
              height: 230,
              width: 210,
              margin: EdgeInsets.only(left: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidget.heightBox(10),
                  Container(
                    height: 25,
                    width: 120,
                    padding: EdgeInsets.all(5),
                    decoration: CommonUtils.getBoxDecoration(
                        color: AppColor.paleBlue, radius: 20),
                    child: Center(
                      child: Text(
                        'Intermediate',
                        style: TextStyle(
                            color: AppColor.darkBlue,
                            fontFamily: AppFont.karla,
                            fontWeight: FontWeight.w300,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  CommonWidget.heightBox(20),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's",
                          style: TextStyle(
                              color: AppColor.textColorDark,
                              fontFamily: AppFont.poppins,
                              fontWeight: FontWeight.w300,
                              fontSize: 23),
                        ),
                        Text(
                          "challenge",
                          style: TextStyle(
                              color: AppColor.textColorDark,
                              fontFamily: AppFont.poppins,
                              fontWeight: FontWeight.w300,
                              fontSize: 23),
                        ),
                      ],
                    ),
                  ),
                  CommonWidget.heightBox(5),
                  Text(
                    'German meals',
                    style: TextStyle(
                        color: AppColor.blue,
                        fontFamily: AppFont.poppins,
                        fontWeight: FontWeight.w300,
                        fontSize: 18),
                  ),
                  CommonWidget.heightBox(10),
                  Row(
                    children: [
                      Image.asset(
                        '${asset}diamond.png',
                        width: 20,
                      ),
                      CommonWidget.widthBox(10),
                      Text(
                        'Take this lesson to\nearn a new milestone ',
                        style: TextStyle(
                            color: AppColor.textColorGrey,
                            fontFamily: AppFont.poppins,
                            fontWeight: FontWeight.w300,
                            fontSize: 14),
                      )
                    ],
                  ),
                  CommonWidget.heightBox(10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCourseTitleRow() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 55, bottom: 10),
      child: Text(
        'Your courses',
        style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            fontSize: 25,
            color: AppColor.textColorDark),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildMain(context),
    );
  }
}
