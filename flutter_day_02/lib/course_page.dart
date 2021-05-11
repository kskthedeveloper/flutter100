import 'package:flutter/material.dart';
import 'package:flutter_day_02/common_widgets.dart';
import 'circle_progress.dart';
import 'common_utlis.dart';
import 'constants.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  String asset = Path.asset;

  Widget buildMain(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColor.backgroundColor,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              '${asset}page2-bg.png',
              width: width,
            ),
          ),
          Positioned(
            child: Container(
            height: height,
            width: width,
            child: ListView(
              children: [
                buildAppBar(),
                buildCourseInfo(),
                buildMilestones(),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: width,
                  height: 500,
                  child: ListView(
                    children: [
                      buildCourseFirstRow(),
                      CommonWidget.heightBox(20),
                      buildCourseSecondRow(),
                      CommonWidget.heightBox(20),
                      buildCourseThirdRow(),
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget buildCourseFirstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildCourseCard(
          title: 'Basics',
          level: 4,
          asset: '${asset}icon1.png',
          progressColor: AppColor.orange,
          isFirst: true,
        ),
        buildCourseCard(
            title: 'Occupations',
            level: 1,
            progressColor: AppColor.textColorPink,
            asset: '${asset}icon2.png'),
      ],
    );
  }

  Widget buildCourseSecondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildCourseCard(
          title: 'Conversation',
          level: 3,
          asset: '${asset}icon3.png',
          progressColor: AppColor.blue,
          isFirst: true,
        ),
        buildCourseCard(
            title: 'Places',
            level: 1,
            progressColor: AppColor.green,
            asset: '${asset}icon4.png'),
      ],
    );
  }

  Widget buildCourseThirdRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildCourseCard(
          title: 'Conversation',
          level: 3,
          asset: '${asset}icon5.png',
          progressColor: AppColor.darkPurple,
          isFirst: true,
        ),
        buildCourseCard(
            title: 'Places',
            level: 2,
            progressColor: AppColor.blue,
            asset: '${asset}icon6.png'),
      ],
    );
  }

  Widget buildCourseCard(
      {String title,
      int level,
      String asset,
      bool isFirst: false,
      Color progressColor}) {
    return Container(
      margin: isFirst ? EdgeInsets.only(right: 13) : EdgeInsets.only(left: 13),
      width: 150,
      height: 150,
      decoration: CommonUtils.getBoxDecoration(
          radius: 8,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColor.purple,
              blurRadius: 10.0,
              spreadRadius: 0.5,
              offset: Offset(
                0.0,
                5.0,
              ),
            )
          ]),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 55,
              width: 55,
              padding: EdgeInsets.all(15),
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
              ], radius: 30),
              child: Image.asset(
                asset,
              ),
            ),
            CommonWidget.heightBox(10),
            Text(
              title,
              style: TextStyle(
                  fontFamily: AppFont.poppins,
                  fontSize: 13,
                  color: Colors.black),
            ),
            Text(
              '$level / 5',
              style: TextStyle(
                  fontFamily: AppFont.karla,
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: Colors.black),
            ),
            CommonWidget.heightBox(10),
            Stack(
              children: [
                Container(
                    height: 4,
                    width: 100,
                    decoration: CommonUtils.getBoxDecoration(
                      color: AppColor.lightGray,
                    )),
                Container(
                    height: 4,
                    width: 20.0 * level,
                    decoration: CommonUtils.getBoxDecoration(
                      color: progressColor,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildMilestones() {
    return Container(
      margin: EdgeInsets.only(left: 40, top: 30, bottom: 20),
      child: (Row(
        children: [
          Image.asset(
            '${asset}diamond.png',
            width: 22,
          ),
          CommonWidget.widthBox(7),
          Image.asset(
            '${asset}diamond.png',
            width: 22,
          ),
          CommonWidget.widthBox(10),
          Text(
            '2 Milestones',
            style: TextStyle(
                fontFamily: AppFont.karla,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColor.paleWhite),
          )
        ],
      )),
    );
  }

  Widget buildCourseInfo() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Spanish',
                  style: TextStyle(
                      fontFamily: AppFont.poppins,
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: AppColor.paleWhite)),
              CommonWidget.heightBox(10),
              Container(
                padding: EdgeInsets.only(left: 8, top: 5, right: 5, bottom: 5),
                margin: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                height: 30,
                width: 100,
                decoration: CommonUtils.getBoxDecoration(
                    color: AppColor.paleWhite, radius: 20),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Beginner',
                        style: TextStyle(
                            fontFamily: AppFont.karla,
                            fontSize: 15,
                            color: AppColor.orange),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColor.orange,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 110),
              height: 90,
              width: 90,
              child: CustomPaint(
                foregroundPainter: CircleProgress(43.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        '43%',
                        style: TextStyle(
                            fontFamily: AppFont.poppins,
                            fontSize: 23,
                            color: Colors.white)
                    ),
                    Text(
                        'Completed',
                        style: TextStyle(
                            fontFamily: AppFont.poppins,
                            fontSize: 7,
                            color: Colors.white)
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Image.asset(
              '${asset}back.png',
              width: 11,
              color: AppColor.paleWhite,
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'Course',
                style: TextStyle(
                    fontFamily: AppFont.karla,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: AppColor.paleWhite),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Image.asset(
              '${asset}more.png',
              width: 20,
              height: 15,
              color: AppColor.paleWhite,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildMain(context),
    );
  }
}
