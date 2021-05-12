import 'package:flutter/material.dart';
import 'package:flutter_day_03/constants.dart';

class HomePage extends StatelessWidget {
  Widget buildMain(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      color: AppColor.blue,
      child: ListView(
        children: [
          buildProfile(),
          buildSubTitle(),
          buildSearchBox(),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 60),
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: ListView(
                    children: [
                      buildTitleForCard(),
                      buildTransportCard(
                          title: 'Bus',
                          image: 'bus',
                          color: AppColor.lightBlue),
                      buildTransportCard(
                          title: 'Bus', image: 'train', color: AppColor.blue)
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  height: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 1,
                            color: Color(0x33000000))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildInfo('Balance', '\$ 18'),
                      buildInfo('Rewards', '\$ 10.25'),
                      buildInfo('Total Trips', '\$ 189'),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Column buildInfo(String title, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
          ),
        ),
        Text(value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Container buildTransportCard({
    String title,
    String image,
    Color color,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 170,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  width: 70,
                  height: 25,
                  child: Center(
                    child: Text('Select',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                )
              ],
            ),
          ),
          Image.asset(
            'assets/images/$image.png',
          )
        ],
      ),
    );
  }

  Widget buildTitleForCard() {
    return Text(
      'Choose your Transport',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget buildSearchBox() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 30, right: 30),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Image.asset(
            'assets/images/search.png',
            width: 20,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Search',
            style: TextStyle(fontSize: 17, color: AppColor.grey),
          )
        ],
      ),
    );
  }

  Widget buildSubTitle() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 30),
      child: Text(
        'Where you will go',
        style: TextStyle(fontSize: 17, color: Colors.white),
      ),
    );
  }

  Widget buildProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 30),
          child: Text(
            "Hello, \nJohn Doe",
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          margin: EdgeInsets.only(right: 30),
          decoration: BoxDecoration(
            color: AppColor.grey,
            borderRadius: BorderRadius.circular(25),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildMain(context),
      bottomNavigationBar: buildNavigation(),
    );
  }

  Widget buildNavigation() {
    return SizedBox(
      height: 85,
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: AppColor.blue,
        unselectedItemColor: AppColor.grey,
        items: [
          buildBottomNavigationBarItem('1'),
          buildBottomNavigationBarItem('2'),
          buildBottomNavigationBarItem('3'),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(String icon) {
    return BottomNavigationBarItem(
        icon: ImageIcon(AssetImage("assets/images/nav-icon$icon.png")),
        label: '');
  }
}
