import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paletteartz/homepage/Channelspage.dart';
import 'package:paletteartz/homepage/Searchpage.dart';
import 'package:paletteartz/constantColor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:paletteartz/profliePage/shared/listImg.dart';
import 'package:paletteartz/artworksPost/postDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final List<String> imgList = [
  //! Array list image for use in Baner
  'assets/img/Ads1.jpg',
  'assets/img/Ads2.png',
  'assets/img/Ads3.jpg',
];

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _token = '';
  bool _waiting = true;
  List artworkList = [];
  List<PhotoItem> _items = [];
  TextEditingController newComment = TextEditingController();

  int _current = 0;
  String token = "";
  var channelobject;
  var artwork;
  List channelList = [];

  final CarouselController _controller = CarouselController();

  void initState() {
    super.initState();
    getToken();
  }

  Future getChannelAPI(String token) async {
    var channel = await getChannel(token);
    // print(channel.body);
    channelobject = jsonDecode(channel.body) as List<dynamic>;
    // print(channelobject);
  }

  Future<http.Response> getChannel(String token) {
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
      channelList.add(
        {
          'id': channelobject[i]["id"],
          'name': channelobject[i]["type_name"],
          'image': 'http://10.0.2.2:3000' + channelobject[i]["type_image_path"]
        },
      );
    }
  }

  void getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userString = await pref.getString('user');

    var userObject = jsonDecode(userString!) as Map<String, dynamic>;
    _token = userObject['token'];
    await getChannelAPI(_token);
    await getArtWorkAPI(_token);

    setState(() {
      LoopChannel();
    });
  }

  Future getArtWorkAPI(String token) async {
    http.Response artworkResponse = await getArtwork(token);
    artworkList = jsonDecode(artworkResponse.body);
    artworkList.shuffle();

    for (int i = 0; i < artworkList.length; i++) {
      String date = artworkList[i]['date_time'].toString();
      List pubDate = date.split(' ');

      _items.add(
        PhotoItem(
            'http://10.0.2.2:3000' + artworkList[i]['image_path'],
            artworkList[i]['title'],
            artworkList[i]['username'],
            pubDate[0],
            artworkList[i]['description'],
            artworkList[i]['tags_name'],
            artworkList[i]['type_name']),
      );
    }
    _waiting = false;
  }

  Future<http.Response> getArtwork(String token) {
    return http.get(
      Uri.parse('http://10.0.2.2:3000/api/homepage/artwork'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token,
      },
    );
  }

//!######## Class SliderBanner ####################
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item,
                          fit: BoxFit.fitWidth,
                          width: 1000.0,
                          color: const Color.fromRGBO(255, 255, 255, 0.5),
                          colorBlendMode: BlendMode.modulate),
                      Positioned(
                        top: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'You can contact to advertise at \nBugcompany@.co.th',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

  //!############## Widget listViewChannel ####################
  Widget listViewChannel(index) {
    if ((index + 1) == 5) {
      return Container(
        height: 20,
        width: 170,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: AssetImage('assets/img/uploadedImg/14.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChanelsPage(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'VIEW ALL',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/separate',
            arguments: <String, dynamic>{
              'name': channelList[index]['name'],
            },
          );
        },
        child: Container(
          height: 20,
          width: 170,
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                channelList[index]['image'] ?? '',
              ),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                channelList[index]['name'] ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: bgBlack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore channelList',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100.0,
                child: channelList.length == 0 ? null : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return listViewChannel(index);
                    }),
              ),
            ),

            //!############## Search ####################
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                decoration: new BoxDecoration(
                  color: purpleG,
                  shape: BoxShape.rectangle,
                  gradient: LinearGradient(
                    colors: [
                      pinkG,
                      lightPurple,
                      purpleG,
                      blueG,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: new TextField(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Searchpage(),
                        ),
                      );
                    },
                    cursorColor: Colors.white,
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: Icon(
                        Icons.search_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            //!############## Slider Banner ####################
            Container(
              child: Column(children: [
                CarouselSlider(
                  items: imageSliders,
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: false,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map(
                    (entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.black
                                      : Colors.white)
                                  .withOpacity(
                                      _current == entry.key ? 0.2 : 0.9)),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ]),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  bottom: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore Artworks',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            // ! Container in Explore Artworks
            _waiting
                ? Center(
                    child: const CircularProgressIndicator(
                    backgroundColor: bgBlack,
                    color: purpleG,
                  ))
                : Container(
                    width: size.width,
                    height: size.height * 0.8,
                    color: bgBlack,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                        crossAxisCount: 3,
                      ),
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        // Item rendering
                        return new GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostDetail(),
                                settings:
                                    RouteSettings(arguments: _items[index]),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(_items[index].image),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
