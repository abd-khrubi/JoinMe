import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/screens/ChooseCampusScreen.dart';
import 'package:flutter_app/screens/requests_screen.dart';
import 'package:flutter_app/widgets/MyDrawer.dart';

class HomePage extends StatelessWidget {
  AppUser usr;

  HomePage(this.usr);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome '+usr.username),
      ),
      backgroundColor: Colors.white,

      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          new ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              primary: Colors.deepPurpleAccent,
              shape: StadiumBorder(),
            ),
            child: Text(
              "Play",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChooseCampusScreen()));
            },
          ),
          
          new ElevatedButton(

            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              primary: Colors.deepPurpleAccent,
              shape: StadiumBorder(),
            ),
            child: Text(
              "Notification",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => RequestsScreen()));
            },
          ),
          new Expanded(
            child: Container(),
          ),
        ],
      ),
      drawer: MyDrawer(usr),
    );
  }
}
