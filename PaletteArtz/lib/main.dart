import 'package:flutter/material.dart';
import 'package:paletteartz/artworksPost/postDetail.dart';
import 'package:paletteartz/mainMenu.dart';
import 'package:paletteartz/welcomePage.dart';
import 'package:paletteartz/walletPage/walletPage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/MainMenu',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/MainMenu': (context) => MainMenu(),
        '/postDetail': (context) => PostDetail(),
      },
    ),
  );
}
