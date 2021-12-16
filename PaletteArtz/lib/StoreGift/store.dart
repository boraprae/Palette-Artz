import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:flutter/material.dart';
import 'package:paletteartz/constantColor.dart';

class Storegift extends StatefulWidget {
  const Storegift({Key? key}) : super(key: key);

  @override
  _StoregiftState createState() => _StoregiftState();
}

class _StoregiftState extends State<Storegift> {
  var itemCount;
  Widget itemStroe(String name, int price, String img) {
    return Column(
      children: [
        Image.asset(img),
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              selectItem(name, price);
            },
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(), primary: Colors.purple),
            child: Text('$price'))
      ],
    );
  }

  Future selectItem(String name, int price) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Total $price฿"),
              CustomNumberPicker(
                  onValue: (value) {
                    print(value);
                    itemCount = value;
                  },
                  initialValue: 0,
                  maxValue: 999,
                  minValue: 0,
                  step: 1)
            ],
          ),
          actions: [FlatButton(onPressed: () {}, child: Text('BUY'))],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgBlack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0, 5),
            child: Text(
              'Item Store',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
            child: Container(
              height: 100,
              width: 370,
              decoration: BoxDecoration(
                color: Color(0xFF3E3E3E),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://icons.iconarchive.com/icons/diversity-avatars/avatars/512/batman-icon.png'),
                    radius: 40,
                  ),
                  SizedBox(
                    height: 10,
                    width: 15,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "SeraYune",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Your balance: ",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Total purchase gift: ",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0, 5.0),
            child: Text(
              'Gift',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
            child: Container(
              height: 300,
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
                        itemStroe('Neno', 500, 'assets/img/toppng5.png'),
                        itemStroe('Champ', 700, 'assets/img/toppng5.png'),
                        itemStroe('Karn', 5000, 'assets/img/toppng5.png'),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        itemStroe('Neno', 500, 'assets/img/toppng5.png'),
                        itemStroe('Neno', 500, 'assets/img/toppng5.png'),
                        itemStroe('Neno', 500, 'assets/img/toppng5.png'),
                      ]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
