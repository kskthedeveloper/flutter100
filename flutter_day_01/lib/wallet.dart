import 'package:flutter/material.dart';
import 'package:flutter_day_01/common_utlis.dart';
import 'package:flutter_day_01/common_widgets.dart';

import 'constants.dart';

class WalletPage extends StatefulWidget {
  WalletPage({
    Key key,
  }) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  String asset = Path.asset;

  Widget buildAppBar() {
    return AppBar(
      leading: Container(
        margin: EdgeInsets.only(left: 30),
        child: Image.asset(
          '${asset}back.png',
        ),
      ),
      leadingWidth: 40,
      centerTitle: true,
      title: Text(
        "Bitcoin Wallet",
        style: TextStyle(
          color: AppColor.textColorDark,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Container(
          height: 20,
          width: 4,
          child: Image.asset(
            '${asset}more.png',
          ),
        ),
        SizedBox(
          width: 30.0,
        )
      ],
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  Container buildCoinInfoCard(
    BuildContext context, {
    String image,
    String coinAmount,
    String coinValue,
    String dollarValue,
    String marketPercentage,
    Color marketPercentageColor,
  }) {
    return Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 25),
        decoration: CommonUtils.getBoxDecoration(
            radius: 13, boxShadow: CommonUtils.getBoxShadow()),
        child: Row(
          children: [
            CommonWidget.widthBox(20),
            Container(
              height: 40,
              width: 40,
              child: Image.asset(image),
            ), // Icon
            CommonWidget.widthBox(20),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coinAmount,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.textColorDark),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    coinValue,
                    style: TextStyle(color: AppColor.textColorGrey),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dollarValue,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.textColorDark),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  marketPercentage,
                  style: TextStyle(color: marketPercentageColor),
                ),
              ],
            ),
            CommonWidget.widthBox(20),
          ],
        ));
  }

  Widget buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, right: 35.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Day',
            style: TextStyle(color: AppColor.textColorGrey),
          ),
          Container(
            height: 30,
            width: 75,
            padding: EdgeInsets.all(5),
            decoration: CommonUtils.getBoxDecoration(
                color: AppColor.textColorGrey, radius: 20),
            child: Center(
              child: Text(
                'Week',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Text(
            'Month',
            style: TextStyle(color: AppColor.textColorGrey),
          ),
          Text(
            'Year',
            style: TextStyle(color: AppColor.textColorGrey),
          ),
        ],
      ),
    );
  }

  Widget buildWalletBalanceCard() {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 100,
      width: 335,
      decoration:
          CommonUtils.getBoxDecoration(boxShadow: CommonUtils.getBoxShadow()),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: Image.asset('${asset}wallet.png'),
                ),
                CommonWidget.widthBox(10),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Bitcoin',
                    style: TextStyle(
                        color: Color(0xff4C5867),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "BTC",
                      style: TextStyle(color: AppColor.textColorGrey),
                    ),
                  ],
                )
              ],
            ),
            CommonWidget.heightBox(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '3.529020 BTC',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColor.textColorDark),
                    ),
                    CommonWidget.heightBox(10),
                    Text(
                      '\$19.153 USD',
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColor.textColorGrey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  width: 75,
                  padding: EdgeInsets.all(5),
                  decoration: CommonUtils.getBoxDecoration(
                      color: AppColor.textColorPink, radius: 20),
                  child: Center(
                    child: Text(
                      '- 3.23%',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            CommonWidget.heightBox(15),
            Container(
              width: double.infinity,
              height: 15,
              child: Center(
                child: Container(
                  height: 30,
                  width: 30,
                  child: Image.asset('${asset}down_arrow.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWalletChartCard() {
    return Container(
      margin: EdgeInsets.only(left: 25.0, right: 25.0, top: 10),
      height: 180,
      width: 335,
      decoration:
          CommonUtils.getBoxDecoration(boxShadow: CommonUtils.getBoxShadow()),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30.0, left: 20.0, bottom: 20.0, right: 30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildStatus(
                      color: AppColor.textColorPink,
                      status: 'Lower: \$4.895'
                    ),
                    buildStatus(
                      color: AppColor.textColorGreen,
                      status: 'Higher: \$6.857'
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: -50,
            child: Container(
                height: 130,
                child: Image.asset('${asset}chart.png'),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: buildStatus(
                color: Color(0xffFFC843),
                status: '1 BTC = \$5.483',
                textColor: Colors.black
            ),
          )
        ],
      ),
    );
  }

  Row buildStatus({Color color, String status, Color textColor: AppColor.textColorGrey}) {
    return Row(
      children: [
        Container(
          height: 8,
          width: 8,
          decoration: CommonUtils.getBoxDecoration(
            radius: 10,
            color: color,
            boxShadow: textColor == Colors.black ? [
              BoxShadow(
                color: color,
                blurRadius: 5.0,
                spreadRadius: 1.0,
                offset: Offset(
                  0,
                  0,
                ),
              )
            ] : []
          ),
        ),
        CommonWidget.widthBox(8),
        Text(
          status,
          style: TextStyle(fontSize: 15, color: textColor),
        )
      ],
    );
  }

  Widget buildWalletBalanceRow() {
    return Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding:
            const EdgeInsets.only(left: 15.0, right: 0.0, top: 20, bottom: 15),
        children: [
          buildWalletBalanceCard(),
        ],
      ),
    );
  }

  Widget buildOrderRow() {
    return Container(
      margin: EdgeInsets.all(25),
      child: Row(
        children: [
          buildOrderButton(
            '${asset}buy.png',
            'Buy'
          ),
          CommonWidget.widthBox(20),
          buildOrderButton(
            '${asset}sell.png',
            'Sell'
          ),
        ],
      ),
    );
  }

  Expanded buildOrderButton(
      String asset,
      String title
      ) {
    return Expanded(
        flex: 1,
        child: Container(
          decoration: CommonUtils.getBoxDecoration(
            boxShadow: CommonUtils.getBoxShadow()
          ),
          height: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                child: Image.asset(
                  asset
                ),
              ),
              CommonWidget.heightBox(15),
              Text(
                '$title BTC',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColor.textColorDark
                ),
              )
            ],
          ),
        ),
      );
  }

  Widget buildMain(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColor.backgroundColor,
      child: ListView(
        children: [
          buildWalletBalanceRow(),
          buildTitle(),
          buildWalletChartCard(),
          buildOrderRow()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildMain(context),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          buildBottomNavigationBarItem('1'),
          buildBottomNavigationBarItem('2'),
          buildBottomNavigationBarItem('3'),
          buildBottomNavigationBarItem('4'),
        ],
        currentIndex: 0,
        selectedItemColor: Color(0xff4C5968),
        unselectedItemColor: AppColor.textColorGrey,
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(String item) {
    return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/images/footer-icon$item.png")),
      label: '',
    );
  }
}
