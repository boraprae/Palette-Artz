import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paletteartz/artworksetting/setting.dart';
import 'package:paletteartz/constantColor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String username = 'SaraYune';
  String bioText = 'Don’t follow your dream, just follow my arts';
  List userUnique = ['Anime', 'Fanart', 'Fantasy'];
  String profileImg = 'assets/img/winter.jpg';
  String profileCoverImg = 'assets/img/longing_by_serayu.jpg';
  String phoneNum = '0123456789';
  String userEmail = 'gmail@seraYune.com';
  String gender = 'Female';

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController tagController = TextEditingController();

  Widget buildTextField(String labelText, String placeholder, var controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.white,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: bgBlack,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //**------ profile cover image ---**
                Container(
                  height: 0.2 * size.height,
                  width: size.width,
                  child: Image.asset(
                    profileCoverImg,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 60, 32, 8),
                  child: Column(
                    children: [
                      buildTextField('Name', username, usernameController),
                      buildTextField('Email', userEmail, emailController),
                      buildTextField(
                          "Phone Number", phoneNum, phoneNumberController),
                      buildTextField("Gender", gender, genderController),
                      buildTextField("Bio", bioText, bioController),
                      buildTextField("Art Style", userUnique[0], tagController),
                      SizedBox(
                        height: 0.05 * size.height,
                        width: size.width,
                        child: OutlineButton(
                          borderSide: BorderSide(
                            color: purpleG,
                            width: 1,
                          ),
                          onPressed: () {
                            //!------ Function for save button here -------!
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()),
                            );
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: purpleG,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0.1 * size.height,
              left: 0.05 * size.width,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 0.12 * size.width,
                    backgroundImage: AssetImage(profileImg),
                  ),
                  Positioned(
                    bottom: 0.01 * size.width,
                    right: 0.01 * size.width,
                    child: InkWell(
                      onTap: () {
                        //!------ Function for uploade profile image paste here -----!
                      },
                      child: CircleAvatar(
                        radius: 0.03 * size.width,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.edit,
                          size: 0.025 * size.width,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 0.16 * size.height,
              right: 0.03 * size.width,
              child: SizedBox(
                height: 0.03 * size.height,
                child: OutlineButton(
                  onPressed: () {
                    //!----- Function for change profile cover paste here------
                  },
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0.5,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 0.025 * size.width,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Upload Cover Photo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
