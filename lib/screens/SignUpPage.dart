import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/app_user.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/screens/HomePage.dart';
import 'package:flutter_app/screens/NotificationScreen.dart';
import 'package:flutter_app/screens/ProfilePage.dart';
import 'package:flutter_app/utils/firebase_utils.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage();

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AppUser usr = AppUser('1', 'hussam@gmail.com', 'hussamsal', '421', 'dsa',
      {Campus.har}, {Activity.chess});

  TextEditingController emailController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late File _image = File('assets/images/blank_avatar.png');
  bool hasPicked = false;
  final picker = ImagePicker();
  var picked = false;

  signUp(BuildContext context) {

    if (userController.text != "" &&
        emailController.text != "" &&
        passwordController.text != "") {
      register(userController.text, emailController.text,
              passwordController.text)
          .then((user) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProfilePage(user!)));
      }).catchError((error) {
        print(error);
      });
    }
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        hasPicked = true;
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("Create an account"),
              centerTitle: true,
              backgroundColor: Colors.deepOrange,
            ),
            body: Center(
                child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: (hasPicked)
                              ? Image.file(_image).image
                              : Image.asset('assets/images/blank_avatar.png')
                                  .image),
                    ),
                    Text("Choose a profile picture",
                        style: TextStyle(fontSize: 14.0)),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Text("Enter User Name", style: TextStyle(fontSize: 15)),
                        Spacer()
                      ],
                    ),
                    TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'User Name'),
                        controller: userController),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text("Enter Email Address",
                            style: TextStyle(fontSize: 15)),
                        Spacer()
                      ],
                    ),
                    TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "Email"),
                        controller: emailController),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text("Enter Password", style: TextStyle(fontSize: 15)),
                        Spacer()
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Password'),
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: true,
                      controller: passwordController,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        signUp(context);
                      },
                      child: Text('Sign up'),
                    )
                  ],
                )
              ],
            ))));
    //todo: profile picture: empty avatar + clickable
    //todo: button sends data to database.
    //todo: optional sign in with google/fb
    //todo: listview to elevate shit
  }
}
