import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paletteartz/constantColor.dart';
import 'package:paletteartz/profliePage/shared/listImg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PostDetail extends StatefulWidget {
  const PostDetail({Key? key}) : super(key: key);

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  TextEditingController newComment = TextEditingController();
  int _selectedIndex = 0;
  String _token = '';
  var userInfoList;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  void getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userString = await pref.getString('user');

    var userObject = jsonDecode(userString!) as Map<String, dynamic>;
    _token = userObject['token'];
    getUserDataAPI(_token);
  }

  void getUserDataAPI(String token) async {
    http.Response userInfoResponse = await getUserInfo(token);

    setState(() {
      userInfoList = jsonDecode(userInfoResponse.body);
    });
  }

  Future<http.Response> getUserInfo(String token) {
    return http.get(
      Uri.parse('http://10.0.2.2:3000/api/profile'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token,
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int itemCount = 0;
  bool showTextAlert = false;
  bool selectedItem = false;
  String textAlert = 'Please select the item first';
  String selectedItemText = 'You don\'t select any gift yet.';
  String itemName = '';

  String totalComment = '0';
  String totalLikes = '1.2k';
  String username = 'SaraYune';

  //!------- List of items(Update after connect to the db) ------!
  List giftStore = [
    {
      "itemName": "Gift Box",
      "itemAmount": 50,
      "itemImg": "assets/img/gift1.png"
    },
    {
      "itemName": "Mistletoe",
      "itemAmount": 30,
      "itemImg": "assets/img/gift2.png"
    },
    {
      "itemName": "Butterfly",
      "itemAmount": 10,
      "itemImg": "assets/img/gift3.png"
    },
    {
      "itemName": "Rainbow",
      "itemAmount": 15,
      "itemImg": "assets/img/gift4.png"
    },
    {
      "itemName": "Crown",
      "itemAmount": 7,
      "itemImg": "assets/img/gift5.png",
    },
    {
      "itemName": "Diamond",
      "itemAmount": 19,
      "itemImg": "assets/img/gift6.png"
    },
  ];

  void getName(String name) {
    setState(() {
      itemName = name;
    });
  }

  //*---------- Item store for sale -----------*
  Widget itemStore(String name, int amount, String img, var setState) {
    return GestureDetector(
      onTap: () {
        setState(() {
          itemCount = 0;
          selectedItemText = 'You\'re selecting $name';
          getName(name);
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              child: Image.asset(
                img,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              '$name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            Text(
              '$amount pieces',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //* ----- Modal Bottom Sheet for give an item -----
  Future selectItem() async {
    return await showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        backgroundColor: lightGray,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: 0.5 * MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                      child: Text(
                        'Select Gifts',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(color: grayText),
                    //!--- Center area ----
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          itemStore(
                            giftStore[0]['itemName'],
                            giftStore[0]['itemAmount'],
                            giftStore[0]['itemImg'],
                            setState,
                          ),
                          itemStore(
                            giftStore[1]['itemName'],
                            giftStore[1]['itemAmount'],
                            giftStore[1]['itemImg'],
                            setState,
                          ),
                          itemStore(
                            giftStore[2]['itemName'],
                            giftStore[2]['itemAmount'],
                            giftStore[2]['itemImg'],
                            setState,
                          ),
                        ]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        itemStore(
                          giftStore[3]['itemName'],
                          giftStore[3]['itemAmount'],
                          giftStore[3]['itemImg'],
                          setState,
                        ),
                        itemStore(
                          giftStore[4]['itemName'],
                          giftStore[4]['itemAmount'],
                          giftStore[4]['itemImg'],
                          setState,
                        ),
                        itemStore(
                          giftStore[5]['itemName'],
                          giftStore[5]['itemAmount'],
                          giftStore[5]['itemImg'],
                          setState,
                        ),
                      ],
                    ),
                    Divider(color: grayText),
                    //*--- Add amount area ---
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  selectedItemText,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border:
                                              Border.all(color: Colors.white),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '$itemCount',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      //?--- Remove Item button ---
                                      Positioned(
                                        right: 115,
                                        child: ClipOval(
                                          child: Material(
                                            color: pinkG, // Button color
                                            child: InkWell(
                                              splashColor:
                                                  lightPurple, // Splash color
                                              onTap: () {
                                                setState(() {
                                                  if (itemCount > 0) {
                                                    itemCount -= 1;
                                                  } else {
                                                    textAlert =
                                                        'You decrese for what? It\'s still zero!';
                                                    showTextAlert = true;
                                                  }
                                                });
                                              },
                                              child: SizedBox(
                                                width: 35,
                                                height: 35,
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //?--- End of remove item button ---
                                      //? ---- Add item button ----
                                      Positioned(
                                        left: 115,
                                        child: ClipOval(
                                          child: Material(
                                            color: pinkG, // Button color
                                            child: InkWell(
                                              splashColor:
                                                  lightPurple, // Splash color
                                              onTap: () {
                                                setState(() {
                                                  itemCount += 1;
                                                  showTextAlert = false;
                                                });
                                              },
                                              child: SizedBox(
                                                width: 35,
                                                height: 35,
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //? ---- End of add item button ----
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(86, 0, 8, 0),
                                child: TextButton(
                                  onPressed: () {
                                    //!---- after pressed send button ---
                                    sendItem(itemName, itemCount, setState);
                                  },
                                  child: Text(
                                    'Send',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: showTextAlert,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      textAlert,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  //!---- After pressed send botton -----
  void sendItem(String itemName, int totalItem, var setState) {
    setState(() {
      if (itemName == null || itemName == '') {
        textAlert = 'Please select the item first';
        showTextAlert = true;
      } else if (totalItem <= 0) {
        textAlert = 'Hey! How about the amount dude!';
        showTextAlert = true;
      } else {
        print("**This is an item which you selected na :)**");
        print("Item name: $itemName, Total: $totalItem");
        Navigator.pop(context);
      }
    });

    //?-- waiting for kranny ;-; --?
  }

  @override
  Widget build(BuildContext context) {
    final _items = ModalRoute.of(context)!.settings.arguments as PhotoItem;
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 5,
      initialIndex: 4,
      child: Scaffold(
        backgroundColor: bgBlack,
        appBar: AppBar(
          backgroundColor: bgBlack,
          title: Text('Artworks'),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    selectedItemText = 'You don\'t select any gift yet.';
                    itemCount = 0;
                    selectItem();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.redeem,
                        size: 26.0,
                        color: purpleG,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'SEND GIFT',
                        style: TextStyle(
                          color: purpleG,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
        //tab bar wil paste here
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 0.4 * size.height,
              width: size.width,
              child: Image.network(
                _items.image,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        _items.imgTitle,
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
                          _items.imgTag[0],
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
                          _items.imgTag[1],
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
                        GestureDetector(
                          onTap: () {
                            //!-------- Paste code for go to another profile here ----
                            print('Waiting for view another profile');
                          },
                          child: Row(
                            children: [
                              //!--- User profile here
                              CircleAvatar(
                                radius: 10.0,
                                backgroundImage: NetworkImage('http://10.0.2.2:3000' + userInfoList['profile_image']),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  _items.pubUsername,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Published: ' + _items.pubDate,
                          style: TextStyle(
                            fontSize: 12,
                            color: grayText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    _items.description,
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
                          'assets/img/winter.jpg',
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
