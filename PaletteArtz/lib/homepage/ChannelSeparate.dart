import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paletteartz/artworksPost/postDetail.dart';
import 'package:paletteartz/constantColor.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:paletteartz/profliePage/shared/listImg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'image_data.dart';
import 'package:http/http.dart' as http;

class SeparatePage extends StatefulWidget {
  const SeparatePage({Key? key}) : super(key: key);

  @override
  _SeparatePageState createState() => _SeparatePageState();
}

class _SeparatePageState extends State<SeparatePage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    print(data);
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        backgroundColor: bgBlack,
        title:
            Text('${data['name']}'), //! can chang name title but now hard code
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: InstagramSearchGrid(data),
      ),
    );
  }
}

class InstagramSearchGrid extends StatefulWidget {
  final _data;
  const InstagramSearchGrid(this._data);
  @override
  _InstagramSearchGridState createState() => _InstagramSearchGridState();
}

class _InstagramSearchGridState extends State<InstagramSearchGrid> {
  List apiImageList = [];
  String _token = "";
  String localIP = "http://10.0.2.2:3000";
  void initState() {
    super.initState();
    getToken();
  }

  Future getChannelNameAPI(String token) async {
    var channelDetails =
        await getChannelName(token, widget._data['id'].toString());
    print(channelDetails.statusCode);
    if (channelDetails.statusCode > 299) {
      return print(channelDetails.body);
    }
    var channelDetailsObj = jsonDecode(channelDetails.body);
    // print(channelDetailsObj);
    return channelDetailsObj;
  }

  Future<http.Response> getChannelName(String token, String query) {
    return http.get(
        Uri.parse('http://10.0.2.2:3000/api/homepage/channel?id=${query}'),
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

  Future getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userString = await pref.getString('user');

    var userObject = jsonDecode(userString!) as Map<String, dynamic>;
    _token = userObject['token'];
    var channelPostResponseBody = await getChannelNameAPI(_token);
    for (var post in channelPostResponseBody) {
      apiImageList.add(ImageData(
          id: post['id'].toString(), imageUrl: localIP + post['image_path'], data: post)
          );
    }
    print(apiImageList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: apiImageList.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          print(apiImageList[index].id);
          Map user_id = {
            "user_id": apiImageList[index].data['user_id'].toString()
          };
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  PostDetail(userData: user_id),
              settings: RouteSettings(arguments: PhotoItem(
                apiImageList[index].imageUrl,
                apiImageList[index].data['title'],
                apiImageList[index].data['username'],
                apiImageList[index].data['date_time'],
                apiImageList[index].data['description'],
                apiImageList[index].data['tags_name'],
                apiImageList[index].data['type_name'],
              )),
            ),
          );
        },
        child: ImageCard(
          imageData: apiImageList[index],
        ),
      ),
      staggeredTileBuilder: (index) => StaggeredTile.count(
          (index % 8 == 0) ? 2 : 1, (index % 8 == 0) ? 2 : 1),
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
    );
  }
}

class ImageCard extends StatefulWidget {
  const ImageCard({this.imageData});

  final ImageData? imageData;

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Image.network(widget.imageData!.imageUrl!, fit: BoxFit.cover),
    );
  }
}
