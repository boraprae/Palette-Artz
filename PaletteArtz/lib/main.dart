import 'package:flutter/material.dart';
import 'package:paletteartz/artworksetting/change.dart';
import 'package:paletteartz/artworksetting/setting.dart';
// import 'package:paletteartz/welcomePage.dart';
import 'package:paletteartz/artworksPost/postDetail.dart';
import 'package:paletteartz/mainMenu.dart';
import 'package:paletteartz/welcomePage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/welcome',
      // routes: {
      //   '/welcome': (context) => WelcomePage(),
      // },
      initialRoute: '/MainMenu',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/MainMenu': (context) => MainMenu(),
        '/postDetail': (context) => PostDetail(),
        '/setting': (context) => Profile(),
        '/change': (context) => change(),
      },
    ),
  );
}
