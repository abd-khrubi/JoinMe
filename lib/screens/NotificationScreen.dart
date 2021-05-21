import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/app_user.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/models/request.dart';
import 'package:flutter_app/screens/ChooseCampusScreen.dart';
import 'package:flutter_app/screens/requests_screen.dart';
import 'package:flutter_app/widgets/MyDrawer.dart';
import 'package:flutter_app/widgets/requestListItemNotifications.dart';

class NotificationScreen extends StatelessWidget {
  AppUser usr;




  NotificationScreen(this.usr,);


  @override
  Widget build(BuildContext context) {
    List<Request> newList = [
      // request,
      // request2,
      // request3,
      // request4,
      // request4,
      // request4
    ];

    return Scaffold(
        appBar: AppBar(
          title: FittedBox(fit: BoxFit.fitWidth, child: Text('Notifications')),
          actions: [],
        ),
        backgroundColor: Colors.white,
        body: Stack(children: [
          Container(
            child: ListView.builder(
              itemCount: newList.length,
              itemBuilder: (context, index) {
                return RequestListItemNotifications.dart(newList[index]);
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
              ),
            ],
          )
        ]),
        drawer: MyDrawer(usr));
  }
}
