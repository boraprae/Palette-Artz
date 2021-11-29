import 'package:flutter/material.dart';
import 'package:paletteartz/constantColor.dart';
import 'components/outcomeTile.dart';
import 'components/incomeTile.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  late Size size;
  List<Map> outcomeData = [
    {
      "name": "Gift x100",
      "title": "Purple tulip",
      "datetime": "2021-11-29",
      "amount": "4000",
    },
    {
      "name": "Gift x100",
      "title": "Purple tulip",
      "datetime": "2021-11-29",
      "amount": "3000",
    },
    {
      "name": "Gift x100",
      "title": "Purple tulip",
      "datetime": "2021-11-28",
      "amount": "400",
    },
    {
      "name": "Gift x100",
      "title": "Purple tulip",
      "datetime": "2021-11-28",
      "amount": "1000",
    },
  ];

  List<Map> incomeData = [
    {
      "name": "Sera Yune",
      "title": "Promptpay top up",
      "datetime": "2021-11-29",
      "amount": "7000",
    },
    {
      "name": "Sera Yune",
      "title": "Promptpay top up",
      "datetime": "2021-11-29",
      "amount": "1000",
    },
    {
      "name": "Sera Yune",
      "title": "Promptpay top up",
      "datetime": "2021-11-27",
      "amount": "4000",
    },
    {
      "name": "Sera Yune",
      "title": "Promptpay top up",
      "datetime": "2021-11-27",
      "amount": "9000",
    },
    
  ];

  TextStyle whiteBoldTextStyle(double fontSize) {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    );
  }

  TextStyle whiteNormalTextStyle(double fontSize) {
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize,
    );
  }

  TextStyle whiteLightTextStyle(double fontSize) {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: fontSize,
    );
  }

  List<Widget> _buildOutcomeTile() {
    String currentDateStringCheck = '';
    List<Widget> tiles = [];

    outcomeData.forEach((element) {
      if (element['datetime'] != currentDateStringCheck) {
        Widget dividerDateTile = Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            '${element['datetime']}',
            style: whiteLightTextStyle(11),
          ),
        );
        tiles.add(dividerDateTile);
        currentDateStringCheck = element['datetime'];
        tiles.add(OutcomeTile(
            name: 'Name: ${element['name']}',
            dateTime: '${element['datetime']}',
            title: 'Title: ${element['title']}',
            amount: '-${element['amount']}฿'));

      } else {
        tiles.add(OutcomeTile(
            name: 'Name: ${element['name']}',
            dateTime: '${element['datetime']}',
            title: 'Title: ${element['title']}',
            amount: '-${element['amount']}฿'));
      }
    });

    return tiles;
  }

  List<Widget> _buildIncomeTile() {
    String currentDateStringCheck = '';
    List<Widget> tiles = [];

    incomeData.forEach((element) {
      if (element['datetime'] != currentDateStringCheck) {
        Widget dividerDateTile = Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            '${element['datetime']}',
            style: whiteLightTextStyle(11),
          ),
        );
        tiles.add(dividerDateTile);
        currentDateStringCheck = element['datetime'];
        tiles.add(IncomeTile(
            name: 'Name: ${element['name']}',
            dateTime: '${element['datetime']}',
            title: 'Title: ${element['title']}',
            amount: '${element['amount']}฿'));

      } else {
        tiles.add(IncomeTile(
            name: 'Name: ${element['name']}',
            dateTime: '${element['datetime']}',
            title: 'Title: ${element['title']}',
            amount: '${element['amount']}฿'));
      }
    });

    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: bgBlack,
        appBar: AppBar(
          backgroundColor: bgBlack,
          title: const Text(
            'Palette Artz',
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
          leading: IconButton(
            icon: Image.asset(
              'assets/img/logo3.png',
            ),
            onPressed: () {},
          ),
          bottom: const TabBar(
            indicatorColor: pinkG,
            indicatorWeight: 3,
            tabs: [
              Tab(
                text: 'Outcome history',
              ),
              Tab(
                text: 'Income history',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: _buildOutcomeTile(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: _buildIncomeTile(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
