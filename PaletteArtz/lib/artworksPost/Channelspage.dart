import 'package:flutter/material.dart';
import 'package:paletteartz/artworksPost/ChannelSeparate.dart';
import 'package:paletteartz/constantColor.dart';

class ChanelsPage extends StatefulWidget {
  const ChanelsPage({Key? key}) : super(key: key);

  @override
  _ChanelsPageState createState() => _ChanelsPageState();
}

class _ChanelsPageState extends State<ChanelsPage> {
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/separate',
                              arguments: <String, dynamic>{
                                'name': 'ANIME & MANGA'
                              });
                        },
                        child: Container(
                          height: 90,
                          width: 180,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.dstATop),
                                image:
                                    AssetImage('assets/img/uploadedImg/11.jpg'),
                                fit: BoxFit.cover),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ANIME & MANGA',
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
                    //* Use  this Container
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/separate',
                              arguments: <String, dynamic>{
                                'name': 'K-POP FANART'
                              });
                        },
                        child: Container(
                          height: 90,
                          width: 180,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.dstATop),
                                image:
                                    AssetImage('assets/img/uploadedImg/23.jpg'),
                                fit: BoxFit.cover),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'K-POP FANART',
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/separate',
                              arguments: <String, dynamic>{'name': 'FANTASY'});
                        },
                        child: Container(
                          height: 90,
                          width: 180,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.dstATop),
                                image:
                                    AssetImage('assets/img/uploadedImg/22.jpg'),
                                fit: BoxFit.cover),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'FANTASY',
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
                    //* Use  this Container
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/separate',
                              arguments: <String, dynamic>{
                                'name': 'SERIES FANART'
                              });
                        },
                        child: Container(
                          height: 90,
                          width: 180,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.dstATop),
                                image:
                                    AssetImage('assets/img/uploadedImg/21.jpg'),
                                fit: BoxFit.cover),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'SERIES FANART',
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/separate',
                              arguments: <String, dynamic>{'name': 'GAME ART'});
                        },
                        child: Container(
                          height: 90,
                          width: 180,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.dstATop),
                                image:
                                    AssetImage('assets/img/uploadedImg/20.jpg'),
                                fit: BoxFit.cover),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'GAME ART',
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
                    //* Use  this Container
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/separate',
                              arguments: <String, dynamic>{
                                'name': 'ILLUSARATION'
                              });
                        },
                        child: Container(
                          height: 90,
                          width: 180,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.dstATop),
                                image:
                                    AssetImage('assets/img/uploadedImg/19.jpg'),
                                fit: BoxFit.cover),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ILLUSTRATION',
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/separate',
                              arguments: <String, dynamic>{
                                'name': 'DIGITAL ART'
                              });
                        },
                        child: Container(
                          height: 90,
                          width: 180,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.dstATop),
                                image:
                                    AssetImage('assets/img/uploadedImg/18.jpg'),
                                fit: BoxFit.cover),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'DIGITAL ART',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
