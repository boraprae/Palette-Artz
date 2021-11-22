import 'package:flutter/material.dart';
import 'package:paletteartz/artworksPost/postDetail.dart';
import 'package:paletteartz/constantColor.dart';
import 'package:paletteartz/profliePage/shared/listImg.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({Key? key}) : super(key: key);

  @override
  _MainProfileState createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  
  double totalArtwork = 270;
  double totalLikes = 1300;
  double totalFollower = 4900;
  double totalFollowing = 512;

  String username = 'SaraYune';
  String bioText = 'Don’t follow your dream, just follow my arts';
  List userUnique = ['Anime', 'Fanart', 'Fantasy'];
  String profileImg = 'assets/img/winter.jpg';
  String profileCoverImg = 'assets/img/longing_by_serayu.jpg';

  final List<PhotoItem> _items = [
    PhotoItem(
      "assets/img/uploadedImg/01.jpg",
      "Arai",
      "Sara Yune",
      "Sep 15, 2021",
      "lineless commission for Panalee0819 thanks for commissioning",
      [
        'Anime',
        'Fanart',
      ],
      '',
    ),
    PhotoItem(
      "assets/img/uploadedImg/02.jpg",
      "Mai roo",
      "Stephan Seeber",
      "Sep 4, 2021",
      "lineless commission for Panalee0819 thanks for commissioning",
      [
        'Anime',
        'Fanart',
      ],
      '',
    ),
    PhotoItem(
      "assets/img/uploadedImg/03.png",
      "55555",
      "Stephan Seeber",
      "Sep 4, 2021",
      "lineless commission for Panalee0819 thanks for commissioning",
      [
        'Anime',
        'Fanart',
      ],
      '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: bgBlack,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //cover image
                Container(
                  height: 0.15 * size.height,
                  width: size.width,
                  child: Image.asset(
                    profileCoverImg,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                //User's stat
                Padding(
                  padding: const EdgeInsets.fromLTRB(180, 0, 36, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textForm(_items.length.toStringAsFixed(0), 'Artworks'),
                      textForm(totalLikes.toStringAsFixed(0), 'Likes'),
                      textForm(totalFollowing.toStringAsFixed(0), 'Follower'),
                      textForm(totalFollower.toStringAsFixed(0), 'Following'),
                    ],
                  ),
                ),
                //User's bio
                Padding(
                  padding: const EdgeInsets.fromLTRB(36, 18, 36, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        bioText,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'UNIQUE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  '${userUnique[0]},${userUnique[1]},${userUnique[2]}'
                                      .toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 0.3 * size.width,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'BADGES',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  ':X',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        width: size.width,
                        child: OutlineButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 0.04 * size.width,
                          ),
                          label: Text(
                            'Settings',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: grayText),
                Padding(
                  padding: const EdgeInsets.fromLTRB(36, 8, 36, 8),
                  child: Text(
                    'Gallery',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                //Gallery
                Container(
                  width: size.width,
                  height: size.height * 0.8,
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
                          // print(index);
                          // print(_items[index]);
                          // Navigator.pushNamed(context, '/postDetail');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PostDetail(),
                              settings: RouteSettings(arguments: _items[index]),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(_items[index].image),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0.08 * size.height,
              left: 0.05 * size.width,
              child: CircleAvatar(
                backgroundImage: AssetImage(profileImg),
                radius: 0.12 * size.width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget textForm(totalNumber, typeText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          totalNumber,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
      Text(
        typeText,
        style: TextStyle(
          fontSize: 10,
          color: Colors.white,
        ),
      ),
    ],
  );
}
