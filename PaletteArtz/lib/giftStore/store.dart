import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:flutter/material.dart';
import 'package:paletteartz/constantColor.dart';

class Storegift extends StatefulWidget {
  const Storegift({Key? key}) : super(key: key);

  @override
  _StoregiftState createState() => _StoregiftState();
}

class _StoregiftState extends State<Storegift> {
  int itemCount = 0;
  int totalPrice = 0;
  String textAlert = 'Sorry, you can\'t reduce more.';
  bool showTextAlert = false;
  String userImg = 'assets/img/winter.jpg';
  String username = 'SeraYune';
  double userBalance = 0.00;
  double userGiftValue = 0.00;
  int giftNo = 0;
  Color btnRemove = pinkG;

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

//!------ List of user's item(Using dara from database later) ------!
  List userItemInfo = [
    {
      "itemName": "Gift Box",
      "itemAmout": 74,
    },
    {
      "itemName": "Mistletoe",
      "itemAmout": 2,
    },
    {
      "itemName": "Butterfly",
      "itemAmout": 15,
    },
    {
      "itemName": "Rainbow",
      "itemAmout": 20,
    },
    {
      "itemName": "Crown",
      "itemAmout": 1,
    },
    {
      "itemName": "Diamond",
      "itemAmout": 4,
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
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            itemCount = 0;
            totalPrice = 0;
            await selectItem(name, price);
          },
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(), primary: Colors.purple),
          child: Text('฿ $price'),
        ),
      ],
    );
  }

  //*------ Item store of user --------*
  Widget userGifts(String name, int total, String img) {
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
          name,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Text(
          "$total pieces",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  //* ----- Modal Bottom Sheet for buy item -----
  Future selectItem(String name, int price) async {
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
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(color: grayText),
                    //*---- Select amount ----
                    Padding(
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
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.white),
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
                                    color: btnRemove, // Button color
                                    child: InkWell(
                                      splashColor: lightPurple, // Splash color
                                      onTap: () {
                                        setState(() {
                                          removeItem(price);
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
                                      splashColor: lightPurple, // Splash color
                                      onTap: () {
                                        setState(() {
                                          addItem(price);
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
                    Visibility(
                      visible: showTextAlert,
                      child: Center(
                        child: Text(
                          textAlert,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Total price: $totalPrice ฿",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Divider(color: grayText),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              buyItem(name, itemCount, totalPrice);
                            },
                            child: Text(
                              'BUY',
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

  void addItem(int price) {
    itemCount += 1;
    showTextAlert = false;
    totalPrice = price * itemCount;
  }

  void removeItem(int price) {
    if (itemCount > 0) {
      itemCount -= 1;
      totalPrice = price * itemCount;
    } else {
      showTextAlert = true;
    }
  }

  //! After pressed buy botton
  void buyItem(String itemName, int totalItem, int totalPrice) {
    print("**This is an order**");
    print("Item name: $itemName, Total: $totalItem, Total Price: $totalPrice");
    Navigator.pop(context);

    //?-- waiting for kranny ;-; --?
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: bgBlack,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //**** Start contents ****
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Item Store',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //*----- Profile balance area -----*
              Container(
                height: 0.15 * size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: lightGray,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(userImg),
                        radius: 40,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 0.02 * size.height,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 32.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Your balance",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "฿$userBalance",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total gifts value",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "฿$userGiftValue",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //* ---- Show User's gift ---- *
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Text(
                  'My Gifts',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          userGifts(
                            userItemInfo[0]['itemName'],
                            userItemInfo[0]['itemAmout'],
                            giftStore[0]['itemImg'],
                          ),
                          userGifts(
                            userItemInfo[1]['itemName'],
                            userItemInfo[1]['itemAmout'],
                            giftStore[1]['itemImg'],
                          ),
                          userGifts(
                            userItemInfo[2]['itemName'],
                            userItemInfo[2]['itemAmout'],
                            giftStore[2]['itemImg'],
                          ),
                        ]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        userGifts(
                          userItemInfo[3]['itemName'],
                          userItemInfo[3]['itemAmout'],
                          giftStore[3]['itemImg'],
                        ),
                        userGifts(
                          userItemInfo[4]['itemName'],
                          userItemInfo[4]['itemAmout'],
                          giftStore[4]['itemImg'],
                        ),
                        userGifts(
                          userItemInfo[5]['itemName'],
                          userItemInfo[5]['itemAmout'],
                          giftStore[5]['itemImg'],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Text(
                  'Buy Gifts',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //*--- Show Gift for sell ---*
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
