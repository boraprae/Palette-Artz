import 'package:flutter/material.dart';
import 'package:paletteartz/constantColor.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        title: Text(
          'Settings',
          // style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://icons.iconarchive.com/icons/diversity-avatars/avatars/512/batman-icon.png'),
                    radius: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Plaette Artz name :",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "SaraYune",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.create,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 60,
            ),
            Text(
              'Application Settings',
              style: TextStyle(color: Colors.grey),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.vpn_key,
                    color: Colors.white,
                  ),
                  Text(
                    '  Change Password',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Others',
              style: TextStyle(color: Colors.grey),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.lock_clock_rounded,
                    color: Colors.white,
                  ),
                  Text(
                    '  Transactions history',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  Text(
                    '   Log out',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
