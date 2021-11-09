import 'package:flutter/material.dart';
import 'package:paletteartz/welcomePage.dart';
import 'package:paletteartz/walletPage/walletPage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/wallet',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/wallet': (context) => WalletPage(),
      },
    ),
  );
}
