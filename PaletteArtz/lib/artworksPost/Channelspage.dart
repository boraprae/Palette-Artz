import 'package:flutter/material.dart';
import 'package:paletteartz/constantColor.dart';

class ChanelsPage extends StatefulWidget {
  const ChanelsPage({Key? key}) : super(key: key);

  @override
  _ChanelsPageState createState() => _ChanelsPageState();
}

class _ChanelsPageState extends State<ChanelsPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const Widget Name = const Text(
    'ANIME & MANGA',
    style: TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        backgroundColor: bgBlack,
        title: Text('Channels'),
        automaticallyImplyLeading: true,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 90,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: AssetImage(''), fit: BoxFit.cover),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Name,
                          ],
                        ),
                      ),
                    ),
                    //* Use  this Container
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Colors.red,
                        height: 90,
                        width: 180,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Colors.red,
                        height: 90,
                        width: 180,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Colors.red,
                        height: 90,
                        width: 180,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Colors.red,
                        height: 90,
                        width: 180,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Colors.red,
                        height: 90,
                        width: 180,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Colors.red,
                        height: 90,
                        width: 180,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Colors.red,
                        height: 90,
                        width: 180,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Colors.red,
                        height: 90,
                        width: 180,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Colors.red,
                        height: 90,
                        width: 180,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Colors.red,
                        height: 90,
                        width: 180,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
