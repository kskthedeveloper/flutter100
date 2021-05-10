import 'package:flutter/material.dart';
import 'package:flutter_day_01/common_utlis.dart';
import 'package:flutter_day_01/common_widgets.dart';

import 'constants.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String asset = Path.asset;

  Widget buildAppBar() {
    return AppBar(
      leading: Container(
        margin: EdgeInsets.only(left: 30),
        child: Image.asset(
          '${asset}leading1.png',
        ),
      ),
      leadingWidth: 50,
      centerTitle: true,
      title: Text(
        "Wallets",
        style: TextStyle(
          color: AppColor.textColorDark,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Container(
          height: 20,
          width: 20,
          child: Image.asset(
            '${asset}leading2.png',
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

  Widget buildCoinInfoList(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25.0, right: 25, top: 15),
      height: 400,
      width: double.infinity,
      child: ListView(
        children: [
          buildCoinInfoCard(
              context,
              image: '${asset}bitcoin.png',
              coinAmount: '3.529020 BTC',
              coinValue: '\$ 5.441',
              dollarValue: '\$19.153',
              marketPercentage: '+ 4.32%',
              marketPercentageColor: AppColor.textColorGreen
          ),
          buildCoinInfoCard(
              context,
              image: '${asset}ethcoin.png',
              coinAmount: '12.633681 ETH',
              coinValue: '\$ 401',
              dollarValue: '\$4.822',
              marketPercentage: '+ 3.97%',
              marketPercentageColor: AppColor.textColorGreen
          ),
          buildCoinInfoCard(
              context,
              image: '${asset}xrpcoin.png',
              coinAmount: '1911.633681 XRP',
              coinValue: '\$ 0.45',
              dollarValue: '\$859',
              marketPercentage: '- 13.56%',
              marketPercentageColor: AppColor.textColorPink
          ),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, right: 35.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sorted by higher %',
            style: TextStyle(color: AppColor.textColorGrey),
          ),
          Row(
            children: [
              Text(
                '24H',
                style: TextStyle(color: AppColor.textColorGrey),
              ),
              Icon(Icons.keyboard_arrow_down_rounded,
                  color: AppColor.textColorGrey)
            ],
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
                  child: Image.asset(
                      '${asset}wallet.png'
                  ),
                ),
                Text(
                  'Total Wallet Balance',
                  style: TextStyle(color: Color(0xff4C5867)),
                ),
                Row(
                  children: [
                    Text(
                      "USD",
                      style: TextStyle(color: AppColor.textColorGrey),
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded,
                        color: AppColor.textColorGrey)
                  ],
                )
              ],
            ),
            CommonWidget.heightBox(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$39.584',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColor.textColorDark),
                    ),
                    CommonWidget.heightBox(10),
                    Text(
                      '7.251332 BTC',
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
                      color: AppColor.textColorDarkGreen, radius: 20),
                  child: Center(
                    child: Text(
                      '+ 3.55%',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
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

  Widget buildWalletBalanceRow() {
    return Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding:
        const EdgeInsets.only(left: 15.0, right: 0.0, top: 20, bottom: 15),
        children: [
          buildWalletBalanceCard(),
          buildWalletBalanceCard(),
        ],
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
          buildCoinInfoList(context)
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
      icon: ImageIcon(
          AssetImage("assets/images/footer-icon$item.png")
      ),
      label: '',
    );
  }
}
