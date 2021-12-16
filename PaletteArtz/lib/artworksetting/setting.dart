import 'package:flutter/material.dart';
import 'package:paletteartz/artworksetting/changePassword.dart';
import 'package:paletteartz/artworksetting/editProfile.dart';
import 'package:paletteartz/constantColor.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = 'SaraYune';
  String profileImg = 'assets/img/winter.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        title: Text(
          'Settings',
        ),
        backgroundColor: bgBlack,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/editProfile');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      profileImg,
                    ),
                    radius: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Plaette Artz name",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          username,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.create,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Application Settings',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/changePassword');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16,),
                child: Row(
                  children: [
                    Icon(
                      Icons.vpn_key_sharp,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Change Password',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Text(
              'Others',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/transaction');
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.lock_clock_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Transactions history',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            //!---- Log out tap need to connect with logout function -----!
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/welcome');
              },
              child: Row(
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Log out',
                    style: TextStyle(color: Colors.white),
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
