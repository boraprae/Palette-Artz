import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameTextField = TextEditingController();
  final emailTextField = TextEditingController();
  final passwordTextField = TextEditingController();

  Future<http.Response> signup() {
    return http.post(
      Uri.parse('http://10.0.2.2:3000/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': usernameTextField.text,
        'email': emailTextField.text,
        'password': passwordTextField.text,
      }),
    );
  }

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
                          child: TextFormField(
                            controller: usernameTextField,
                          ),
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
                          child: TextFormField(
                            controller: emailTextField,
                          ),
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
                          child: TextFormField(
                            controller: passwordTextField,
                          ),
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
                        ), //! ===========================  ยังไม่ได้ทำfuntion confirm password ฝั่งหน้าบ้าน  ===============================
                        Padding(
                          padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
                          child: TextFormField(),
                        ),
                        //button sign in
                        ElevatedButton(
                          onPressed: () async {
                            var Signup = await signup();
                          },
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
                              Navigator.pushNamed(context, '/signInpage');
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
