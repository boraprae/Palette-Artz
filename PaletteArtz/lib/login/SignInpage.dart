import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:paletteartz/mainMenu.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextField = TextEditingController();
  final passwordTextField = TextEditingController();

  void saveToken(var body) async {
    Map object = jsonDecode(body) as Map<String, dynamic>;
    print(object['token']);

    setState(() {});

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String objectString = jsonEncode(object);

    prefs.setString('user', objectString);
  }

  Future<http.Response> login() {
    return http.post(
      Uri.parse('http://10.0.2.2:3000/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': emailTextField.text,
        'password': passwordTextField.text
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
                            padding: const EdgeInsets.fromLTRB(100, 100, 0, 0),
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 100, 100, 0),
                            child: Image.asset(
                              'assets/img/logo4.png',
                              width: 50.0,
                              height: 50.0,
                            ),
                          ),
                        ],
                      ),

                      //username
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 80, 150, 0),
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
                          controller: emailTextField,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              )),
                        ),
                      ),
                      //password
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
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              )),
                        ),
                      ),
                      //forget password?
                      Padding(
                        padding: const EdgeInsets.fromLTRB(200, 0, 0, 0),
                        child: TextButton(
                            child: Text("Forget Password?"),
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 10),
                              primary: Colors.white,
                            ),
                            onPressed: () {}),
                      ),
                      //button sign in
                      ElevatedButton(
                        onPressed: () async {
                          var Loging = await login();
                          saveToken(Loging.body);
                          if (Loging.statusCode < 299) {
                            Navigator.pushNamed(context, '/mainMenu');
                          }
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
                            'Sign in',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      //Sign in with Google
                      SignInButton(
                        Buttons.Google,
                        text: "Sign in with Google",
                        onPressed: () {},
                      ),
                      //
                      SignInButton(
                        Buttons.Facebook,
                        text: "Sign in with Facebook",
                        onPressed: () {},
                      ),
                      TextButton(
                          child: Text("Don't have account? Sing Up"),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/signUppage');
                          }),
                    ],
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

mixin Response {}
