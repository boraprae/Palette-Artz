import 'package:flutter/material.dart';
import 'package:paletteartz/constantColor.dart';
import 'package:paletteartz/profliePage/mainProfile.dart';
import 'package:paletteartz/profliePage/shared/listImg.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({Key? key}) : super(key: key);

  @override
  _PostDetailState createState() => _PostDetailState();
}

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
    final _items = ModalRoute.of(context)!.settings.arguments as PhotoItem;
    Size size = MediaQuery.of(context).size;
    int itemCount = 0;
    String totalComment = '0';
    String totalLikes = '1.2k';
    String username = 'SaraYune';

    //*------- List of items(Statix data, do not need changing) ------*
    List giftStore = [
      {
        "itemName": "Gift Box",
        "itemPrice": 50,
        "itemImg": "assets/img/gift1.png"
      },
      {
        "itemName": "Mistletoe",
        "itemPrice": 150,
        "itemImg": "assets/img/gift2.png"
      },
      {
        "itemName": "Butterfly",
        "itemPrice": 350,
        "itemImg": "assets/img/gift3.png"
      },
      {
        "itemName": "Rainbow",
        "itemPrice": 550,
        "itemImg": "assets/img/gift4.png"
      },
      {
        "itemName": "Crown",
        "itemPrice": 1500,
        "itemImg": "assets/img/gift5.png",
      },
      {
        "itemName": "Diamond",
        "itemPrice": 5000,
        "itemImg": "assets/img/gift6.png"
      },
    ];

    //*---------- Item store for sale -----------*
    Widget itemStore(String name, int price, String img) {
      return Column(
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
            '$name ฿price',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
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
                  height: 300,
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
                      //!Center area
                      Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                itemStore(
                                  giftStore[0]['itemName'],
                                  giftStore[0]['itemPrice'],
                                  giftStore[0]['itemImg'],
                                ),
                                itemStore(
                                  giftStore[1]['itemName'],
                                  giftStore[1]['itemPrice'],
                                  giftStore[1]['itemImg'],
                                ),
                                itemStore(
                                  giftStore[2]['itemName'],
                                  giftStore[2]['itemPrice'],
                                  giftStore[2]['itemImg'],
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
                                giftStore[3]['itemPrice'],
                                giftStore[3]['itemImg'],
                              ),
                              itemStore(
                                giftStore[4]['itemName'],
                                giftStore[4]['itemPrice'],
                                giftStore[4]['itemImg'],
                              ),
                              itemStore(
                                giftStore[5]['itemName'],
                                giftStore[5]['itemPrice'],
                                giftStore[5]['itemImg'],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(color: grayText),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                                child: Row(
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
                                                    // removeItem(price);
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
                                                    //addItem(price);
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
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                //!---- after pressed send button ---
                              },
                              child: Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
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
              child: Image.asset(
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
                        CircleAvatar(
                          radius: 10.0,
                          backgroundImage: AssetImage(
                            'assets/img/winter.jpg',
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
                          _items.pubDate,
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
