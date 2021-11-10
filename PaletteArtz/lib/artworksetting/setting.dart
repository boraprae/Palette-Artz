import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text(
          'Settings',
          // style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://icons.iconarchive.com/icons/diversity-avatars/avatars/512/batman-icon.png'),
                radius: 40,
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
            Text(
              'Change Password',
              style: TextStyle(color: Colors.yellow, fontSize: 22),
            ),
            SizedBox(height: 10),
            Text(
              'Others',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'Transactions history',
              style: TextStyle(color: Colors.yellow, fontSize: 22),
            ),
            Text(
              'Log out',
              style: TextStyle(color: Colors.yellow, fontSize: 22),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.mail,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                Text(
                  'noonelefthide@gmail.com',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
