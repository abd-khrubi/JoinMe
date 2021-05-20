import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File _image;
  final picker = ImagePicker();

  signUp() {
    if(userController.text != "" && emailController.text != ""
        && passwordController.text != "") {
      User user = new User("", emailController.text, userController.text, {}, {});
    }
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
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            //todo: get image from gallery
                          },
                        child:CircleAvatar(radius: 50.0,),

                        ),
                        Text("Choose a profile picture",
                            style: TextStyle(fontSize: 16.0)),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            Text("Enter User Name",
                                style: TextStyle(fontSize: 15)),
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
                                border: OutlineInputBorder(),
                                hintText: "Email"),
                            controller: emailController),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text("Enter Password",
                                style: TextStyle(fontSize: 15)),
                            Spacer()
                          ],
                        ),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Password'),
                          enableSuggestions: false,
                          autocorrect: false,
                          obscureText: true,
                          controller: passwordController,
                        ),
                        ElevatedButton(
                            onPressed: signUp(), child: Text("Sign Up"))
                      ],
                    )))));
    //todo: profile picture: empty avatar + clickable
    //todo: button sends data to database.
    //todo: optional sign in with google/fb
    //todo: listview to elevate shit
  }
}




