import 'package:flutter/material.dart';
import 'package:paletteartz/constantColor.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  _SearchpageState createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> with TickerProviderStateMixin {
  late TabController _tabController;

  List history = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextField(
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: new InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
        ),
        backgroundColor: bgBlack,
        automaticallyImplyLeading: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: pinkG,
          tabs: const <Widget>[
            Tab(
              text: 'Artworks',
            ),
            Tab(
              text: 'Arttists',
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Container(
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent searches',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15.0,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Clear All',
                            style: TextStyle(
                              color: lightPurple,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Recent searches',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 15.0,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                child: Text(
                                  'Clear All',
                                  style: TextStyle(
                                    color: lightPurple,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: history.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                child: Container(
                                  child: ListTile(
                                    title: Text(
                                      '${history[index]['name']}',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                background: Container(
                                  color: Colors.grey[400],
                                ),
                                key: Key(history[index]['name']),
                                onDismissed: (direction) {
                                  setState(() {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text("Remove history")));
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
