import 'package:flutter/material.dart';
import 'package:flutter_app/screens/SignInPage.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/screens/SignUpPage.dart';
import 'package:flutter_app/screens/test_screen.dart';
import 'package:flutter_app/utils/firebase_utils.dart';
import 'package:get_it/get_it.dart';

import 'models/user.dart';
import 'services/user_service.dart';
import 'package:firebase_core/firebase_core.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => new UserService());
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var userSrv = locator<UserService>();
    print('Getting user....');
    var user = userSrv.getUser("lmLvoGDT3aNNQQ0LZjEh");
    print(user);

    var usr = new User(
        'hiiiiii',
        'whaaat@gmail.com',
        'nammmmmme',
        '0002145',
        '',
        [Campus.givat, Campus.har],
        [Activity.basketball]
    );
    // saveUser(usr).then((value) => {
    //   print('Done saving user')
    // });



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
      home: SignInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

