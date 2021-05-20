import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/screens/ChooseCampusScreen.dart';
import 'package:flutter_app/screens/requests_screen.dart';
import 'package:flutter_app/widgets/MyDrawer.dart';

class HomePage extends StatelessWidget {
  User usr;

  HomePage(this.usr);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Welcome,  ' + usr.username + "\n Check your notifications:"),
        actions:
        [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed:(){
              //todo: open notifications screen
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(top:600),
              child: ElevatedButton(
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChooseCampusScreen()));
            },
          )),
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RequestsScreen()));
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
