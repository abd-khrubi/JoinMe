import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/HomePage.dart';
import 'package:flutter_app/SignUpPage.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/app_user.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import 'package:flutter_app/utils/firebase_utils.dart';


import 'HomePage.dart';
import 'SignUpPage.dart';

class SignInPage extends StatelessWidget {


  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();


  _login(BuildContext context) {

    if (_emailController.text != "" && _passwordController.text != "") {
      login(_emailController.text, _passwordController.text).then((value) {
        //Navigation
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HomePage(value!)));
      }).catchError((error) {
        print(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Image.asset(
              "assets/images/signIn.png",
              height: 250,

              fit: BoxFit.fitWidth,
            ),

            /// This section for Email field
            Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.all(30),
              alignment: Alignment.center,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    filled: true,
                    prefixIcon: Icon(Icons.person),
                    border: UnderlineInputBorder(),
                    hintText: "Enter your Email"),
              ),
            ),

            /// End email field
            ///Start section password Field
            Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  filled: true,
                  prefixIcon: Icon(Icons.password),
                  labelText: 'Password',
                  contentPadding: EdgeInsets.only(top: 30),
                ),
              ),
            ),

            ///Start with signIn button
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Login'),
                  onPressed: () {
                    _login(context);
                  },
                )),

            SignInButton(
              Buttons.Google,
              text: "Sign in with Google",
              onPressed: () {},
            ),
            SignInButton(
                Buttons.Facebook,
                onPressed: () {},
                text: "Sign in with Facebook"),
            ///Ending with signIn button
            ///Start with Sign up
            Container(
              padding: EdgeInsets.only(top: 80, left: 100),
              child: Row(
                children: <Widget>[
                  Text("Don't have an account?"),
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text(
                      'Sign up',
                      style: TextStyle(fontSize: 15),

                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpPage()));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
