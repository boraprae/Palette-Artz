import 'package:flutter/material.dart';
import 'package:paletteartz/constantColor.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController newComment = TextEditingController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        backgroundColor: bgBlack,
        title: Text('Palette Artz'),
        automaticallyImplyLeading: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications_none_outlined),
          )
        ],
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: bgBlack, primaryColor: bgBlack),
        child: BottomNavigationBar(
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
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore Channels',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Views All',
                      style: TextStyle(color: lightPurple),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 80.0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(width: 129.0, color: pinkG),
                    Container(width: 129.0, color: purpleG),
                    Container(width: 129.0, color: blueG),
                    Container(width: 129.0, color: lightPurple),
                    Container(width: 129.0, color: pinkG),
                    Container(width: 129.0, color: purpleG),
                    Container(width: 129.0, color: blueG),
                    Container(width: 129.0, color: lightPurple),
                  ],
                ),
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
