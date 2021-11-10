import 'package:flutter/material.dart';

class change extends StatefulWidget {
  @override
  State<change> createState() => _changeState();
}

class _changeState extends State<change> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          // style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Current Password'),
          TextField(),
          SizedBox(height: 5),
          Text('New Password'),
          TextField(),
          SizedBox(height: 5),
          Text('Confirm New Password'),
          TextField(),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Save')),
            ],
          ),
        ]),
      ),
    );
  }
}
