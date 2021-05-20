import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
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
                        CircleAvatar(radius: 50.0),
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
                                hintText: 'User Name')),
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
                            hintText: "Email"
                          ),
                        ),
                        SizedBox(height:20),
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
                            obscureText: true),
                      ],
                    )))));
    //todo: profile picture: empty avatar + clickable
    //todo: button sends data to database.
    //todo: optional sign in with google/fb
  }
}
