import 'package:flutter/material.dart';
import 'package:flutter_app/screens/ProfilePage.dart';
import 'package:flutter_app/screens/SignUpPage.dart';
import 'package:flutter_app/screens/test_screen.dart';
import 'models/user.dart';
import 'services/user_service.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  User usr = User("", "hi@gmail.com", "stuff", "119929292", "9292", {},{});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfilePage(user: usr,),
      debugShowCheckedModeBanner: false,
    );
  }
}

