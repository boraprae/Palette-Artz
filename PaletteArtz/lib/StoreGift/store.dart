import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:flutter/material.dart';
import 'package:paletteartz/constantColor.dart';

class Storegift extends StatefulWidget {
  const Storegift({Key? key}) : super(key: key);

  @override
  _StoregiftState createState() => _StoregiftState();
}

class _StoregiftState extends State<Storegift> {
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
                        Container(
                          width: 120,
                          height: 100,
                          color: bgBlack,
                          child: Column(
                            children: [
                              Image.asset('assets/img/toppng5.png'),
                              Text(
                                "Tulip",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    AlertDialog(
                                      title: Text('Tulip'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Total 150฿"),
                                          CustomNumberPicker(
                                              onValue: (value) {},
                                              initialValue: 0,
                                              maxValue: 999,
                                              minValue: 0,
                                              step: 1)
                                        ],
                                      ),
                                      actions: [
                                        FlatButton(
                                            onPressed: () {},
                                            child: Text('BUY'))
                                      ],
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      primary: Colors.purple),
                                  child: Text("150"))
                            ],
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 100,
                          color: bgBlack,
                          child: Column(
                            children: [
                              Image.asset('assets/img/toppng5.png'),
                              Text(
                                "Tulip",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  AlertDialog(
                                    title: Text('Tulip'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("Total 150฿"),
                                        CustomNumberPicker(
                                            onValue: (value) {},
                                            initialValue: 0,
                                            maxValue: 999,
                                            minValue: 0,
                                            step: 1)
                                      ],
                                    ),
                                    actions: [
                                      FlatButton(
                                          onPressed: () {}, child: Text('BUY'))
                                    ],
                                  );
                                },
                                child: Text(
                                  "150",
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    primary: Colors.purple),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 100,
                          color: bgBlack,
                          child: Column(
                            children: [
                              Image.asset('assets/img/toppng5.png'),
                              Text(
                                "Tulip",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    AlertDialog(
                                      title: Text('Tulip'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Total 150฿"),
                                          CustomNumberPicker(
                                              onValue: (value) {},
                                              initialValue: 0,
                                              maxValue: 999,
                                              minValue: 0,
                                              step: 1)
                                        ],
                                      ),
                                      actions: [
                                        FlatButton(
                                            onPressed: () {},
                                            child: Text('BUY'))
                                      ],
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      primary: Colors.purple),
                                  child: Text("150"))
                            ],
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 120,
                          height: 100,
                          color: bgBlack,
                          child: Column(
                            children: [
                              Image.asset('assets/img/toppng5.png'),
                              Text(
                                "Tulip",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    AlertDialog(
                                      title: Text('Tulip'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Total 150฿"),
                                          CustomNumberPicker(
                                              onValue: (value) {},
                                              initialValue: 0,
                                              maxValue: 999,
                                              minValue: 0,
                                              step: 1)
                                        ],
                                      ),
                                      actions: [
                                        FlatButton(
                                            onPressed: () {},
                                            child: Text('BUY'))
                                      ],
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      primary: Colors.purple),
                                  child: Text("150"))
                            ],
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 100,
                          color: bgBlack,
                          child: Column(
                            children: [
                              Image.asset('assets/img/toppng5.png'),
                              Text(
                                "Tulip",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    AlertDialog(
                                      title: Text('Tulip'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Total 150฿"),
                                          CustomNumberPicker(
                                              onValue: (value) {},
                                              initialValue: 0,
                                              maxValue: 999,
                                              minValue: 0,
                                              step: 1)
                                        ],
                                      ),
                                      actions: [
                                        FlatButton(
                                            onPressed: () {},
                                            child: Text('BUY'))
                                      ],
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      primary: Colors.purple),
                                  child: Text("150"))
                            ],
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 100,
                          color: bgBlack,
                          child: Column(
                            children: [
                              Image.asset('assets/img/toppng5.png'),
                              Text(
                                "Tulip",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    AlertDialog(
                                      title: Text('Tulip'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Total 150฿"),
                                          CustomNumberPicker(
                                              onValue: (value) {},
                                              initialValue: 0,
                                              maxValue: 999,
                                              minValue: 0,
                                              step: 1)
                                        ],
                                      ),
                                      actions: [
                                        FlatButton(
                                            onPressed: () {},
                                            child: Text('BUY'))
                                      ],
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      primary: Colors.purple),
                                  child: Text("150"))
                            ],
                          ),
                        ),
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
