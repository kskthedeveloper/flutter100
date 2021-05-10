import 'package:flutter/material.dart';
import 'package:flutter_day_01/wallet.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, fontFamily: 'SF Pro Display Regular'),
      // home: MyHomePage(),
      home: WalletPage(),
    );
  }
}
