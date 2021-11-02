import 'package:flutter/material.dart';
import 'package:paletteartz/welcomePage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomePage(),
      },
    ),
  );
}
