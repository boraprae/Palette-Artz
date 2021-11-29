import 'package:flutter/material.dart';
import 'package:paletteartz/honepage/ChannelSeparate.dart';
import 'package:paletteartz/honepage/Channelspage.dart';
import 'package:paletteartz/honepage/Searchpage.dart';
import 'package:paletteartz/login/SignInpage.dart';
import 'package:paletteartz/login/SignUppage.dart';
import 'package:paletteartz/artworksetting/change.dart';
import 'package:paletteartz/artworksetting/setting.dart';
// import 'package:paletteartz/welcomePage.dart';
import 'package:paletteartz/artworksPost/postDetail.dart';
import 'package:paletteartz/mainMenu.dart';
import 'package:paletteartz/welcomePage.dart';
import 'package:paletteartz/walletPage/walletPage.dart';
import 'package:paletteartz/artworksPost/Homepage.dart';
import 'package:paletteartz/transactionHistory/transactionHistory.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/mainMenu',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/SignInpage': (context) => LoginPage(),
        '/SignUppage': (context) => RegisterPage(),
        '/mainMenu': (context) => MainMenu(),
        '/postDetail': (context) => PostDetail(),
        '/homepage': (context) => Homepage(),
        '/channelspage': (context) => ChanelsPage(),
        '/serach': (context) => Searchpage(),
        '/separate':(context) => SeparatePage(),
        '/setting': (context) => Profile(),
        '/change': (context) => change(),
        '/transaction': (context) => TransactionPage(),
      },
    ),
  );
}
