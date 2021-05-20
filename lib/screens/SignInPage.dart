import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/HomePage.dart';
import 'package:flutter_app/SignUpPage.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/models/user.dart';

import 'HomePage.dart';
import 'SignUpPage.dart';


class SignInPage extends StatelessWidget{

  User usr= new User('1','hussam@gmail.com','hussamsal','421','dsa',{Campus.har},{Activity.chess});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Join me"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          elevation: 20,
        ),

        body: ListView(
          children: [
            Image.network
            //TODO : Crop the pic
              ("https://i.pinimg.com/originals/a4/08/e4/a408e44aae1357ac9b73a2b08935f62a.jpg",
              fit: BoxFit.contain,),

            /// This section for Email field
            Container(
              height: 100,width: 100,
              padding: EdgeInsets.all(30),
              alignment: Alignment.center,
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    floatingLabelBehavior:FloatingLabelBehavior.auto,
                    filled: true,
                    prefixIcon: Icon(Icons.person),
                    border: UnderlineInputBorder(),
                    hintText: "Enter your Email"
                ),
              ),
            ),
            /// End email field
            ///Start section password Field
            Container(
              height: 50,width: 50,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  floatingLabelBehavior:FloatingLabelBehavior.auto,
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
            //TODO : return data from firebase
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(usr)));


                  },
                )),
            ///Ending with signIn button
            ///Start with Sign up
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Text('Does not have account?'),
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text('Sign up', style: TextStyle(fontSize: 20),),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage()));

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


