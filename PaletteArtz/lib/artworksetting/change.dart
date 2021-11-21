import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:paletteartz/constantColor.dart';

class change extends StatefulWidget {
  @override
  State<change> createState() => _changeState();
}

class _changeState extends State<change> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        title: Text(
          'Change Password',
          // style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: Text(
              'Current Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Text(
              'New Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Text(
              'Confirm New Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: BorderSide(color: Colors.purple)),
                  onPressed: () {},
                  padding: EdgeInsets.fromLTRB(120, 0, 120, 0),
                  color: bgBlack,
                  textColor: Colors.purple,
                  child: Text("Save", style: TextStyle(fontSize: 15)),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
