import 'package:flutter/material.dart';
import 'package:paletteartz/artworksPost/ChannelSeparate.dart';
import 'package:paletteartz/artworksPost/Channelspage.dart';
import 'package:paletteartz/artworksPost/Searchpage.dart';
import 'package:paletteartz/artworksPost/postDetail.dart';
import 'package:paletteartz/mainMenu.dart';
import 'package:paletteartz/welcomePage.dart';
import 'package:paletteartz/artworksPost/Homepage.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/MainMenu',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/MainMenu': (context) => MainMenu(),
        '/postDetail': (context) => PostDetail(),
        '/homepage': (context) => Homepage(),
        '/channelspage': (context) => ChanelsPage(),
        '/serach': (context) => Searchpage(),
        '/separate':(context) => SeparatePage(),
      },
    ),
  );
}
