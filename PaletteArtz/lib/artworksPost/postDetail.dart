import 'dart:io';

import 'package:flutter/material.dart';
import 'package:paletteartz/constantColor.dart';
import 'package:paletteartz/welcomePage.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({Key? key}) : super(key: key);

  @override
  _PostDetailState createState() => _PostDetailState();
}

String titlePost = '(cm) Blake';
String pubDate = 'Sep 4, 2021';
String captionPost =
    'lineless commission for Panalee0819 \nthanks for commissioning';
String totalComment = '0';
String totalLikes = '1.2k';
String username = 'SaraYune';

class _PostDetailState extends State<PostDetail> {
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
        title: Text('Artworks'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => WelcomePage())),
        ),
      ),
      bottomNavigationBar: new Theme(
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
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 0.4 * size.height,
              child: Image.asset(
                'assets/img/blake_by_serayune_deqcznm.jpg',
                fit: BoxFit.fitWidth,
              ),
              alignment: Alignment.topCenter,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        titlePost,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Container(
                        color: pinkG,
                        padding: EdgeInsets.all(6.0),
                        child: Text(
                          'Cute girl',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        color: pinkG,
                        padding: EdgeInsets.all(6.0),
                        child: Text(
                          'Commissioning',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 10.0,
                          backgroundImage: AssetImage(
                            'assets/img/iu.jpg',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            username,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          'Published: $pubDate',
                          style: TextStyle(
                            fontSize: 12,
                            color: grayText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    captionPost,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 28.0,
                        ),
                        Text(
                          ' $totalLikes likes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        Text(
                          ' $totalComment comments',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: grayText),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Comments',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10.0,
                        backgroundImage: AssetImage(
                          'assets/img/iu.jpg',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 0.73 * size.width,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: grayText,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextField(
                          controller: newComment,
                          decoration: InputDecoration(
                            hintText: 'Add new comment',
                            hintStyle: TextStyle(
                              color: grayText,
                              fontSize: 12,
                            ),
                            // disabledBorder: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(5.0),
                            //   borderSide: BorderSide(
                            //     color: grayText,
                            //   ),
                            // ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Post',
                          style: TextStyle(
                            color: lightPurple,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
