import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 100, 0, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Image.asset(
                        'assets/images/logo4.png',
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
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
                  onPressed: () {
                    print('1');
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
                      Navigator.pushNamed(context, '/SignUppage');
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
