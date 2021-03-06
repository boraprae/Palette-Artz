import 'package:flutter/material.dart';
import 'package:paletteartz/giftStore/store.dart';
import 'package:paletteartz/artworksPost/addNewPost.dart';
import 'package:paletteartz/homepage/Homepage.dart';
import 'package:paletteartz/artworksetting/changePassword.dart';
import 'package:paletteartz/artworksetting/editProfile.dart';
import 'package:paletteartz/artworksetting/setting.dart';
import 'package:paletteartz/constantColor.dart';
import 'package:paletteartz/profliePage/mainProfile.dart';
import 'package:paletteartz/walletPage/walletPage.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _onItemTapped(3); // for testing
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: bgBlack,
        appBar: AppBar(
          backgroundColor: bgBlack,
          title: const Text(
            'Plaette Artz',
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
          leading: IconButton(
            icon: Image.asset(
              'assets/img/logo3.png',
            ),
            onPressed: () {},
          ),
        ),
        bottomNavigationBar: Container(
          color: bgBlack,
          child: const TabBar(
            indicatorColor: Colors.transparent,
            labelColor: lightPurple,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.storefront,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.add_box_outlined,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.account_balance_wallet_outlined,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          //home page class
          Homepage(),
          //store page class
          Storegift(),
          //add post class
          AddNewPost(),
          //wallet page class
          WalletPage(),
          //profile page class
          MainProfile(),
        ]),
      ),
    );
  }
}
