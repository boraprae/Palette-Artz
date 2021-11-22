import 'package:flutter/material.dart';
import 'package:paletteartz/artworksPost/postDetail.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF161616),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            width: 0.9 * size.width,
            height: 1.0 * size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment(-1.0, 0.4),
                colors: [
                  Color(0xFF212F9C),
                  Color(0xFF7A2997),
                  Color(0xFFD7378F),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 32, 32, 32),
              child: Stack(
                children: [
                  Positioned(
                    top: 0.65 * size.height,
                    child: Container(
                      width: 0.5 * size.width,
                      height: 0.09 * size.height,
                      decoration: BoxDecoration(
                        color: Color(0xFF161616),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                        ),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black,
                        //     blurRadius: 14.0, // soften the shadow
                        //     spreadRadius: 1.0, //extend the shadow
                        //     offset: Offset(
                        //       5.0, // Move to right 10  horizontally
                        //       4.0, // Move to bottom 10 Vertically
                        //     ),
                        //   ),
                        // ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.4 * size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Text(
                            'Palette\nArtz',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                          child: Text(
                            'Best community to find your\nstyle and shared your artworks!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/SignInpage');
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(32, 48, 0, 0),
                            child: Row(
                              children: [
                                Text(
                                  'GET STARTS!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
