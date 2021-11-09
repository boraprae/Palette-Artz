import 'package:flutter/material.dart';
import 'package:paletteartz/constantColor.dart';

class PaletteArtzBottomNavBar extends StatefulWidget {
  const PaletteArtzBottomNavBar({Key? key}) : super(key: key);

  @override
  _PaletteArtzBottomNavBarState createState() =>
      _PaletteArtzBottomNavBarState();
}

class _PaletteArtzBottomNavBarState extends State<PaletteArtzBottomNavBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: bgBlack,
        primaryColor: bgBlack,
      ),
      child: BottomNavigationBar(
        backgroundColor: bgBlack,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.storefront,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box_outlined,
              ),
              label: ''),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: purpleG,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
