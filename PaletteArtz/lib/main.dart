import 'package:flutter/material.dart';
import 'package:paletteartz/artworksPost/ChannelSeparate.dart';
import 'package:paletteartz/artworksPost/Channelspage.dart';
import 'package:paletteartz/artworksPost/Searchpage.dart';
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


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/SignInpage': (context) => LoginPage(),
        '/SignUppage': (context) => RegisterPage(),
        '/MainMenu': (context) => MainMenu(),
        '/postDetail': (context) => PostDetail(),
        '/homepage': (context) => Homepage(),
        '/channelspage': (context) => ChanelsPage(),
        '/serach': (context) => Searchpage(),
        '/separate':(context) => SeparatePage(),
        '/setting': (context) => Profile(),
        '/change': (context) => change(),
      },
    ),
  );
}
