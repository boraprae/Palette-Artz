import 'package:flutter/material.dart';
import 'package:paletteartz/constantColor.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

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

  final List<Widget> imageSliders = imgList
      .map(
        (item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: 500.0,
                    ),
                    Positioned(
                      child: Container(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Fantasy',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      )
      .toList();

 

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
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
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
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 2.0,
              ),
              child: Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 3.0,
                    enlargeCenterPage: true,
                  ),
                  items: imageSliders,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                decoration: new BoxDecoration(
                  color: purpleG,
                  shape: BoxShape.rectangle,
                  gradient: LinearGradient(
                    colors: [
                      pinkG,
                      lightPurple,
                      purpleG,
                      blueG,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: new TextField(
                    cursorColor: Colors.white,
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: Icon(
                        Icons.search_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 3.0,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  ),
                  items: [],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  bottom: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore Artworks',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 100,
                    minWidth: 100,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/img/cm__blake_by_serayune_deqcznm-fullview.jpg',
                            width: 130,
                          ),
                          Image.asset(
                            'assets/img/cm__blake_by_serayune_deqcznm-fullview.jpg',
                            width: 130,
                          ),
                          Image.asset(
                            'assets/img/cm__blake_by_serayune_deqcznm-fullview.jpg',
                            width: 130,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/img/cm__blake_by_serayune_deqcznm-fullview.jpg',
                            width: 130,
                          ),
                          Image.asset(
                            'assets/img/red_dragon_by_pinlin_dep08bi-fullview.jpg',
                            width: 130,
                          ),
                          Image.asset(
                            'assets/img/winter_by_serayune_dejy5jd-fullview.jpg',
                            width: 130,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/img/cm__blake_by_serayune_deqcznm-fullview.jpg',
                            width: 130,
                          ),
                          Image.asset(
                            'assets/img/red_dragon_by_pinlin_dep08bi-fullview.jpg',
                            width: 130,
                          ),
                          Image.asset(
                            'assets/img/winter_by_serayune_dejy5jd-fullview.jpg',
                            width: 130,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/img/cm__blake_by_serayune_deqcznm-fullview.jpg',
                            width: 130,
                          ),
                          Image.asset(
                            'assets/img/red_dragon_by_pinlin_dep08bi-fullview.jpg',
                            width: 130,
                          ),
                          Image.asset(
                            'assets/img/winter_by_serayune_dejy5jd-fullview.jpg',
                            width: 130,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/img/cm__blake_by_serayune_deqcznm-fullview.jpg',
                            width: 130,
                          ),
                          Image.asset(
                            'assets/img/red_dragon_by_pinlin_dep08bi-fullview.jpg',
                            width: 130,
                          ),
                          Image.asset(
                            'assets/img/winter_by_serayune_dejy5jd-fullview.jpg',
                            width: 130,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/img/cm__blake_by_serayune_deqcznm-fullview.jpg',
                            width: 130,
                          ),
                          Image.asset(
                            'assets/img/red_dragon_by_pinlin_dep08bi-fullview.jpg',
                            width: 130,
                          ),
                          Image.asset(
                            'assets/img/winter_by_serayune_dejy5jd-fullview.jpg',
                            width: 130,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
