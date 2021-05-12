import 'package:flutter/material.dart';
import 'package:flutter_day_03/constants.dart';

class TicketPage extends StatelessWidget {
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
              'Ticket',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 160),
                height: 620,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 180, left: 20, right: 20),
                  child: ListView(
                    children: [
                      Text(
                        'Payment',
                        style: TextStyle(
                            fontSize: 25,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Enter Amount',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 10, top: 10),
                        decoration: BoxDecoration(
                          color: AppColor.lightGrey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          '\$   5.0',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColor.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      buildBalanceRow(
                        btnTitle: 'Credit Card',
                        btnColor: AppColor.blue,
                        balance: '84'
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildDivider(),
                      SizedBox(
                        height: 10,
                      ),
                      buildBalanceRow(
                          btnTitle: 'E-Wallet',
                          btnColor: AppColor.lightGrey,
                          textColor: AppColor.black,
                          balance: '84'
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        width: 150,
                        height: 60,
                        child: Center(
                          child: Text('Buy Ticket',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.blue,
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              buildInfoDetail()
            ],
          )
        ],
      ),
    );
  }

  Row buildBalanceRow({
    String btnTitle,
    String balance,
    Color btnColor,
    Color textColor: Colors.white
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 150,
          height: 50,
          child: Center(
            child: Text(btnTitle,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor)),
          ),
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        Text(
          'Balance: \$ $balance',
          style: TextStyle(
            fontSize: 20,
            color: AppColor.black,
          ),
        )
      ],
    );
  }

  Positioned buildInfoDetail() {
    return Positioned(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
        height: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, spreadRadius: 1, color: Color(0x33000000))
            ]),
        child: Column(
          children: [
            buildLocations(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 110,
                  width: 200,
                  child: Column(
                    children: [
                      buildTimeRow(),
                      SizedBox(
                        height: 15,
                      ),
                      buildCommonLabel(
                          image: "time", text: "Lorem MRT Station"),
                      SizedBox(
                        height: 15,
                      ),
                      buildCommonLabel(image: "dollar-icon", text: "\$ 5.0"),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/qrcode.png'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Row buildTimeRow() {
    return Row(
      children: [
        buildCommonLabel(image: "time", text: "10.00"),
        SizedBox(
          width: 10,
        ),
        buildCommonLabel(image: "train-icon", text: "10.30")
      ],
    );
  }

  Container buildCommonLabel({String image, String text}) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            'assets/images/$image.png',
            height: image == 'train-icon' ? 18 : 25,
            width: 25,
          ),
          buildInfoText(text)
        ],
      ),
    );
  }

  Text buildInfoText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 18, color: AppColor.black, fontWeight: FontWeight.bold),
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

  Container buildLocations() {
    return Container(
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
