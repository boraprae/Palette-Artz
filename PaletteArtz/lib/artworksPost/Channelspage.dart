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
                          image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop),
                              image: AssetImage(
                                  'assets/img/flowers_by_serayune_den1imr-fullview.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ANIME & MANGA',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //* Use  this Container
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 90,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop),
                              image: AssetImage(
                                  'assets/img/red_dragon_by_pinlin_dep08bi-fullview.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'K-POP FANART',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 90,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop),
                              image: AssetImage(
                                  'assets/img/winter_by_serayune_dejy5jd-fullview.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'FANTASY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //* Use  this Container
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 90,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop),
                              image: AssetImage(
                                  'assets/img/lantern_by_serayune_denad78-fullview.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SERIES FANART',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 90,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop),
                              image: AssetImage(
                                  'assets/img/lantern_by_serayune_denad78-fullview.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'GAME ART',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //* Use  this Container
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 90,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop),
                              image: AssetImage(
                                  'assets/img/lantern_by_serayune_denad78-fullview.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ILLUSTRATION',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 90,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop),
                              image: AssetImage(
                                  'assets/img/cm__blake_by_serayune_deqcznm-fullview.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'DIGITAL ART',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //* Use  this Container
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 90,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop),
                              image: AssetImage(
                                  'assets/img/lantern_by_serayune_denad78-fullview.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'DRAWING & PATNING',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 90,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop),
                              image: AssetImage(
                                  'assets/img/lantern_by_serayune_denad78-fullview.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'REALISM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //* Use  this Container
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 90,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop),
                              image: AssetImage(
                                  'assets/img/lantern_by_serayune_denad78-fullview.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SKETCH',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 90,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop),
                              image: AssetImage(
                                  'assets/img/lantern_by_serayune_denad78-fullview.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'TRADITIONAL ART',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //* Use  this Container
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 90,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop),
                              image: AssetImage(
                                  'assets/img/lantern_by_serayune_denad78-fullview.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'TUTORIALS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 90,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop),
                              image: AssetImage(
                                  'assets/img/red_dragon_by_pinlin_dep08bi-fullview.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'STREET ART',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //* Use  this Container
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
