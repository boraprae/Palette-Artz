import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:paletteartz/artworksetting/change.dart';
import 'package:paletteartz/artworksetting/setting.dart';
import 'package:paletteartz/constantColor.dart';

class editprofile extends StatefulWidget {
  const editprofile({Key? key}) : super(key: key);

  @override
  _editprofileState createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  bool showPassword = false;
  @override
  final _controller = TextEditingController();

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        style: TextStyle(
          color: Colors.white,
        ),
        cursorColor: Colors.white,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editprofile"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: bgBlack,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ClipRRect(
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://icons.iconarchive.com/icons/diversity-avatars/avatars/512/batman-icon.png'),
                        radius: 40,
                      ),
                      Positioned(
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: BorderSide(color: Colors.grey)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  },
                  padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                  color: bgBlack,
                  textColor: Colors.grey,
                  child: Text("Upload Cover Photo",
                      style: TextStyle(fontSize: 10)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  buildTextField("Name", "", false),
                  buildTextField("E-mail", "", false),
                  buildTextField("Phone Number", "0950718448", true),
                  buildTextField("Gender", "", false),
                  buildTextField("Bio",
                      "Don't follow your dream, just follow my arts", false),
                  buildTextField("Art Style Tags", "", false),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 50.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          side: BorderSide(color: Colors.purple)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      padding: EdgeInsets.fromLTRB(120, 0, 120, 0),
                      color: bgBlack,
                      textColor: Colors.purple,
                      child: Text("Save", style: TextStyle(fontSize: 15)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
