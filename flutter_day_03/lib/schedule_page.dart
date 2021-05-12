import 'package:flutter/material.dart';
import 'package:flutter_day_03/constants.dart';

class SchedulePage extends StatelessWidget {
  Widget buildMain(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      color: AppColor.blue,
      child: ListView(
        children: [
          Center(
            child: Text(
              'MRT',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Image.asset(
            'assets/images/train2.png',
            height: 200,
          ),
          Container(
            height: 700,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(60),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ListView(
                children: [
                  buildLocations(),
                  buildTitle(),
                  buildScheduleInfo(
                    from: '10:00',
                    to: '10:30',
                    place: 'Lorem MRT Station',
                    price: '5.0'
                  ),
                  buildDivider(),
                  buildScheduleInfo(
                      from: '11:05',
                      to: '11:45',
                      place: 'Lorem MRT Station',
                      price: '5.0'
                  ),
                  buildDivider(),
                  buildScheduleInfo(
                      from: '11:25',
                      to: '12:30',
                      place: 'Lorem MRT Station',
                      price: '3.0'
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildScheduleInfo({
    String from,
    String to,
    String place,
    String price
  }) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTimeRow(
                from: from,
                to: to,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/place.png',
                    height: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  buildInfoText(place),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text('\$ $price',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 70,
                height: 25,
                child: Center(
                  child: Text('Select',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                decoration: BoxDecoration(
                  color: AppColor.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildDivider() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      height: 2,
      width: 400,
      color: AppColor.grey,
    );
  }

  Row buildTimeRow({String from, String to}) {
    return Row(
      children: [
        Image.asset(
          'assets/images/time.png',
          height: 30,
        ),
        buildInfoText(from),
        SizedBox(
          width: 5,
        ),
        Image.asset(
          'assets/images/arrow.png',
          width: 30,
        ),
        SizedBox(
          width: 5,
        ),
        buildInfoText(to),
      ],
    );
  }

  Text buildInfoText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 15, color: AppColor.black, fontWeight: FontWeight.bold),
    );
  }

  Container buildTitle() {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 10),
      child: Text(
        'Choose Schedule',
        style: TextStyle(
            fontSize: 25, color: AppColor.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Container buildLocations() {
    return Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 25),
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 1,
                  color: Color(0x33000000),
                  offset: Offset(0, 2))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/marker1.png', // TODO: to refactor with getter
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  width: 2,
                  color: AppColor.grey,
                ),
                Image.asset(
                  'assets/images/marker2.png',
                  height: 30,
                ),
              ],
            ),
            Container(
              height: 170,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildPlaces(title: 'From', place: 'Lorem MRT Station'),
                  Container(
                    // margin: EdgeInsets.all(10),
                    height: 2,
                    width: 200,
                    color: AppColor.grey,
                  ),
                  buildPlaces(title: 'From', place: 'Lorem MRT Station')
                ],
              ),
            ),
          ],
        ));
  }

  Container buildPlaces({String title, String place}) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      height: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, color: AppColor.grey),
          ),
          Text(
            place,
            style: TextStyle(fontSize: 20, color: AppColor.black),
          ),
        ],
      ),
    );
  }

  Column buildInfo(String title, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildMain(context),
    );
  }
}
