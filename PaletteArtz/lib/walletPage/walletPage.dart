import 'package:flutter/material.dart';
import 'package:paletteartz/constantColor.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  double income = 32015;
  double outcome = 59871;
  double walletBalance = 500;
  double incomeFromDonation = 72015;
  double totalIncome = 72015;
  String walletUsername = 'SeraYune';

  List<Map> transactionData = [
    {"transactionType": "Withdraw", "datetime": "2021-11-12", "amount": 21589},
    {"transactionType": "Top Up", "datetime": "2021-11-11", "amount": 500},
    {"transactionType": "Donation", "datetime": "2021-11-10", "amount": 1210},
    {"transactionType": "Withdraw", "datetime": "2021-11-10", "amount": 1210},
    {"transactionType": "Donation", "datetime": "2021-11-10", "amount": 1210},
  ];

  Text _amountTextHandler(Map element) {
    late TextStyle amountTextStyle;

    if (element['transactionType'] == "Top Up" ||
        element['transactionType'] == "Donation") {
      amountTextStyle = TextStyle(
          color: Colors.green, fontWeight: FontWeight.normal, fontSize: 12);
    } else {
      amountTextStyle = TextStyle(
          color: Colors.red, fontWeight: FontWeight.normal, fontSize: 12);
    }
    return Text(
      '฿${element['amount']}',
      style: amountTextStyle,
    );
  }

  List<Widget> _buildTransaction(List<Map> transactions) {
    List<Widget> transactionTile = [];

    transactionData.forEach((element) {
      transactionTile.add(
        InkWell(
          splashColor: pinkG,
          onTap: () {},
          child: Container(
            height: 60,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${element['transactionType']}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    Text(
                      '${element['datetime']}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _amountTextHandler(element),
                  ],
                ),
                Divider(
                  color: Colors.grey[600],
                ),
              ],
            ),
          ),
        ),
      );
    });

    return transactionTile;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: bgBlack,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // Top Page padding container

              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today Revenue',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size.width / 2 - 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(8),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.green[800],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Income',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    '฿$income',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: size.width / 2 - 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(8),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: Colors.red[200],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.red[800],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Outcome',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    '฿$outcome',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      '$walletUsername\'s Wallet',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    // Wallet summation section
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                    width: size.width,
                    height: 120,

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white70,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Wallet Balance',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    '฿$walletBalance',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Income from donation',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    '฿$incomeFromDonation',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    '฿$totalIncome',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: lightPurple,
                          backgroundColor: pinkG,
                          minimumSize: Size(100, 30),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/topUp');
                        },
                        child: Text(
                          'Top Up',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: pinkG,
                          side: BorderSide(color: pinkG),
                          minimumSize: Size(100, 30),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/withdraw');
                        },
                        child: Text(
                          'Withdraw',
                          style: TextStyle(
                            color: pinkG,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Transactions',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/transaction');
                          },
                          child: Text(
                            'See All',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Column(
                        children: _buildTransaction(transactionData),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
