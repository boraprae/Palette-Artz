import 'package:flutter/material.dart';
import 'package:paletteartz/homepage/ChannelSeparate.dart';
import 'package:paletteartz/constantColor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChanelsPage extends StatefulWidget {
  const ChanelsPage({Key? key}) : super(key: key);

  @override
  _ChanelsPageState createState() => _ChanelsPageState();
}

class _ChanelsPageState extends State<ChanelsPage> {
  String token = "";
  var channelobject;
  List Channels = [];
  List<Widget> Chbody = [];

  void initState() {
    super.initState();
    LoopChannel();
  }

  Future gettoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = await prefs.getString('user');
    Map userobject = jsonDecode(userString!) as Map<String, dynamic>;
    print(userobject["token"]);
    token = userobject["token"];
    await getapi();
  }

  Future getapi() async {
    var channel = await getChannel();
    // print(channel.body);
    channelobject = jsonDecode(channel.body) as List<dynamic>;
    // print(channelobject);
    setState(() {
      LoopChannel();
    });
  }

  Future<http.Response> getChannel() {
    return http.get(Uri.parse('http://10.0.2.2:3000/api/homepage/channel'),
        headers: <String, String>{
          // 'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,

          // body: jsonEncode(<String,Sting>{
          //   'id':
          //   'type_name': 'name',
          //   'password': passwordTextField.text
          // }),
        });
  }

  void LoopChannel() {
    for (int i = 0; i < channelobject.length; i++) {
      Channels.add(
        {
          'id': channelobject[i]["id"],
          'name': channelobject[i]["type_name"],
          'image': 'http://10.0.2.2:3000' + channelobject[i]["type_image_path"]
        },
      );
      
      Chbody.add(channel(channelobject[i]));
    }
    setState(() {});
  }

  Widget channel(channelobject) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/separate',
                    arguments: <String, dynamic>{
                      'name':
                          channelobject['name'] //!post data to ChannelSeparate
                    });
              },
              child: Container(
                height: 90,
                width: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstATop),
                      image: NetworkImage(
                          channelobject['image']), //! image can change
                      fit: BoxFit.cover),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      channelobject['name'], //! Text can change
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        backgroundColor: bgBlack,
        title: Text('Channels'),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  children: Chbody,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
