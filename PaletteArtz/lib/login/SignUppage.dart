import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  Color(0xFFD7378F),
                  Color(0xFF7A2997),
                  Color(0xFF212F9C),
                ],
              ),
            ),
            child: Column(
              children: [
                Positioned(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(135, 30, 0, 0),
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 30, 100, 0),
                              child: Image.asset(
                                'assets/img/logo4.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ],
                        ),

                        //username
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 150, 0),
                          child: Text(
                            'Username',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                          child: TextFormField(),
                        ),
                        //Email
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 180, 0),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                          child: TextFormField(),
                        ),
                        //First name
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 140, 0),
                          child: Text(
                            'First name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                          child: TextFormField(),
                        ),
                        //Last name
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 140, 0),
                          child: Text(
                            'Last name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                          child: TextFormField(),
                        ),
                        //Password
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 140, 0),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                          child: TextFormField(),
                        ),
                        //Confirm Password
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 80, 0),
                          child: Text(
                            'Confirm Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
                          child: TextFormField(),
                        ),
                        //button sign in
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
                            child: Text(
                              'Sign up',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        //if not have acc

                        TextButton(
                          child: Text("Already have account? Sign In"),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/SignInpage');
                          }),
                        
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
