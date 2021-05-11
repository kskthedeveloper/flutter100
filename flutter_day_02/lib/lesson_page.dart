import 'package:flutter/material.dart';
import 'package:flutter_day_02/common_widgets.dart';
import 'common_utlis.dart';
import 'constants.dart';

class LessonPage extends StatefulWidget {
  @override
  _LessonPageState createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
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
            top: -5,
            left: -2,
            child: Image.asset(
              '${asset}page3-bg.png',
              width: width + 10,
            ),
          ),
          Positioned(
              child: Container(
            height: height,
            width: width,
            child: ListView(
              shrinkWrap: true,
              children: [
                buildAppBar(),
                buildLessionTitle(),
                buildQuestionCard(),
                buildIndicator(),
                buildAnswerCard(),
                buildCheckButton(width),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Container buildCheckButton(double width) {
    double toReduce = (width / 2) - 27.5;
    return Container(
      height: 55,
      width: 55,
      margin: EdgeInsets.only(left: toReduce, right: toReduce),
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
        '${asset}correct.png',
      ),
    );
  }

  Widget buildQuestionCard() {
    return Container(
      margin: EdgeInsets.all(30.0),
      height: 270,
      width: 200,
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
      ]),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: Image.asset(
              '${asset}icon3.png',
              width: 30,
            ),
          ),
          Positioned(
            top: 30,
            left: 30,
            child: Image.asset(
              '${asset}quote.png',
              width: 10,
            ),
          ),
          Positioned(
            top: 70,
            left: 30,
            child: Text(
              'Buenas noches,\n¿cómo estuvo\nsu día?',
              style: TextStyle(
                  fontFamily: AppFont.poppins,
                  fontSize: 30,
                  color: AppColor.textColorDark),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 30,
            child: Image.asset(
              '${asset}quote.png',
              width: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAnswerCard() {
    return Container(
      margin: EdgeInsets.all(30.0),
      height: 130,
      width: 200,
      decoration: CommonUtils.getBoxDecoration(
        radius: 10,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              'Your answer...',
              style: TextStyle(
                  fontFamily: AppFont.karla,
                  fontSize: 20,
                  color: AppColor.textColorGrey),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildDot(color: AppColor.blue),
        buildDot(),
        buildDot(),
        buildDot(),
        buildDot(),
      ],
    );
  }

  Container buildDot({Color color: AppColor.lightGray}) {
    return Container(
      margin: EdgeInsets.all(9),
      height: 7,
      width: 7,
      decoration: CommonUtils.getBoxDecoration(
        radius: 10,
        color: color,
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

  Row buildCourseSecondRow() {
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

  Row buildCourseThirdRow() {
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

  Container buildCourseCard(
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

  Container buildLessionTitle() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Center(
        child: Text('Transalte these\nphrases to english',
            style: TextStyle(
                fontFamily: AppFont.poppins,
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white)),
      ),
    );
  }

  Container buildAppBar() {
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
                'Lesson',
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
