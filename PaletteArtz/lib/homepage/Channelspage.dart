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
  String localIP = "http://10.0.2.2:3000";

  void initState() {
    super.initState();
    gettoken();
  }

  Future gettoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = await prefs.getString('user');
    Map userobject = jsonDecode(userString!) as Map<String, dynamic>;

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
      Chbody.add(channel(channelobject[i], localIP));
    }
    setState(() {});
  }

  Widget channel(object, ip) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/separate',
                  arguments: <String, dynamic>{
                    'name':
                        object['type_name'], //!post data to ChannelSeparate
                        'id': object['id']
                  });
            },
            child: Container(
              height: 90,
              width: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.dstATop),
                    image: NetworkImage(localIP +
                        object['type_image_path']), //! image can change
                    fit: BoxFit.cover),
                color: Colors.black,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    object['type_name'], //! Text can change
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
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.9,
                  
                  
                  child: GridView.count(
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this would produce 2 rows.
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 2,
               
                    crossAxisCount: 2,
                    // Generate 100 Widgets that display their index in the List
                    children: Chbody.length == 0 ? []: Chbody,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
