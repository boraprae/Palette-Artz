import 'package:flutter/material.dart';
import 'package:paletteartz/homepage/ChannelSeparate.dart';
import 'package:paletteartz/homepage/Channelspage.dart';
import 'package:paletteartz/homepage/Homepage.dart';
import 'package:paletteartz/homepage/Searchpage.dart';
import 'package:paletteartz/login/promptpayTopuppage.dart';
import 'package:paletteartz/login/signInpage.dart';
import 'package:paletteartz/login/signUppage.dart';
import 'package:paletteartz/artworksetting/change.dart';
import 'package:paletteartz/artworksetting/setting.dart';
// import 'package:paletteartz/welcomePage.dart';
import 'package:paletteartz/artworksPost/postDetail.dart';
import 'package:paletteartz/login/withdrawPromptpay.dart';
import 'package:paletteartz/mainMenu.dart';
import 'package:paletteartz/welcomePage.dart';
import 'package:paletteartz/walletPage/walletPage.dart';
import 'package:paletteartz/transactionHistory/transactionHistory.dart';


void main() {
  runApp(
      MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/signInpage',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/signInpage': (context) => LoginPage(),
        '/signUppage': (context) => RegisterPage(),
        '/mainMenu': (context) => MainMenu(),
        '/postDetail': (context) => PostDetail(),
        '/homepage': (context) => Homepage(),
        '/channelspage': (context) => ChanelsPage(),
        '/serach': (context) => Searchpage(),
        '/separate':(context) => SeparatePage(),
        '/setting': (context) => Profile(),
        '/change': (context) => change(),
        '/transaction': (context) => TransactionPage(),
        '/topUp': (context) => TopupPP(),
        '/withdraw': (context) => WithdrawPP(),
      },
    ),
  );
}
