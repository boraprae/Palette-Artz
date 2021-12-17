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
  bool showPassword = true;

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
      body: Padding(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Image.asset(
                    'assets/img/logo4.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),

              //username
              Padding(
                padding: const EdgeInsets.fromLTRB(64, 32, 64, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextFormField(
                      controller: usernameTextField,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    //Email
                    Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextFormField(
                      controller: emailTextField,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    //Password
                    Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextFormField(
                      controller: passwordTextField,
                      style: TextStyle(color: Colors.white),
                      obscureText: showPassword,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ), //button sign in
              ElevatedButton(
                onPressed: () async {
                  if (usernameTextField.text == '' ||
                      emailTextField.text == '' ||
                      passwordTextField.text == '') {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Warning!'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('You have to complete all fields.'),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    var Signup = await signup();
                    emailTextField.clear();
                    usernameTextField.clear();
                    passwordTextField.clear();
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
            ],
          ),
        ),
      ),
    );
  }
}
