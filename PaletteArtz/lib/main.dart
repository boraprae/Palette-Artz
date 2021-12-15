import 'package:flutter/material.dart';
import 'package:paletteartz/login/SignInpage.dart';
import 'package:paletteartz/login/SignUppage.dart';
import 'package:paletteartz/artworksPost/postDetail.dart';
import 'package:paletteartz/mainMenu.dart';
import 'package:paletteartz/welcomePage.dart';

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
      },
    ),
  );
}
