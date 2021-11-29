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
            ),
          )
        ],
      ),
    );
  }
}
