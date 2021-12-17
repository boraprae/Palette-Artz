import 'package:flutter/material.dart';

class OutcomeTile extends StatelessWidget {
  final String name;
  final String dateTime;
  final String title;
  final String amount;

  const OutcomeTile(
      {Key? key,
      required this.name,
      required this.dateTime,
      required this.title,
      required this.amount})
      : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.098,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 6), // margin between tile
      decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$name',
                style: whiteBoldTextStyle(12),
              ),
              Text(
                '$dateTime',
                style: whiteLightTextStyle(12),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$title',
                style: whiteBoldTextStyle(11),
              ),
              Text(
                '$amount',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
