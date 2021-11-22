import 'package:flutter/material.dart';

class TopupPP extends StatefulWidget {
  const TopupPP({Key? key}) : super(key: key);

  @override
  _TopupPPState createState() => _TopupPPState();
}

class _TopupPPState extends State<TopupPP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: Color(0xFF000000),
        title: Text('Top up by Promptpay'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
          primaryColor: Colors.black,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
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
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/QRpp.jpg'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 150,
                      width: 300,
                      color: Color(0xFFFF303030),
                      child: Text(
                        "Reciever Address ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Container(
                      height: 75,
                      width: 250,
                      color: Color(0xFF161616),
                      child: Text(
                        "Reciever Address \n Promptpay's number : 098187703  \n Name : Palette Artz",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFAB47BC),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: Text(
                'Share QR Code',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
