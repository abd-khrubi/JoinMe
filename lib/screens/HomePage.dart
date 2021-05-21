import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/app_user.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/models/request.dart';
import 'package:flutter_app/screens/ChooseCampusScreen.dart';
import 'package:flutter_app/screens/requests_screen.dart';
import 'package:flutter_app/widgets/MyDrawer.dart';
import 'package:flutter_app/widgets/request_list_item.dart';
import 'package:flutter_app/screens/NotificationScreen.dart';

class HomePage extends StatelessWidget {
  AppUser usr;

  HomePage(this.usr);

  Request request = Request(
    "hiiiiii",
    Activity.basketball,
    Campus.givat,
    DateTime.now(),
    DateTime.now(),
  );
  Request request2 = Request(
    "hiiiiii",
    Activity.running,
    Campus.givat,
    DateTime.now(),
    DateTime.now(),
  );
  Request request3 = Request(
    "hiiiiii",
    Activity.chess,
    Campus.givat,
    DateTime.now(),
    DateTime.now(),
  );
  Request request4 = Request(
    "hiiiiii",
    Activity.football,
    Campus.givat,
    DateTime.now(),
    DateTime.now(),
  );
  void homePageNotificationButton(BuildContext context, AppUser usr){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NotificationScreen(usr)));
  }
  @override
  Widget build(BuildContext context) {
    List<Request> newList = [
      request,
      request2,
      request3,
      request4,
      request4,
      request4
    ];

    return Scaffold(
        appBar: AppBar(
          title: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text('Welcome,  ' +
                  usr.username!)),
          actions: [
            IconButton(
              tooltip: "Notifications",
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {
                homePageNotificationButton(context,usr);
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Stack(children: [
          Container(
            height: 550,
            child: ListView.builder(
              itemCount: newList.length,
              itemBuilder: (context, index) {
                return RequestListItem(newList[index]);
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(top: 600),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
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
                ),
              ),
            ],
          )
        ]),
        drawer: MyDrawer(usr));
  }
}
