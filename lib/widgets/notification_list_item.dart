import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/app_user.dart';
import 'package:flutter_app/models/user_notification.dart';
import 'package:flutter_app/utils/firebase_utils.dart';

class NotificationListItem extends StatelessWidget {
  UserNotification notification;

  NotificationListItem(this.notification);

  @override
  Widget build(BuildContext context) {
    var currentUser = getCurrentUser();
    var userId = currentUser.uid;
    var names = ["Abed", "Hussam", "Ahmad", 'Mohammad', "Razi"];

    final _random = new Random();

// generate a random index based on the list length
// and use it to retrieve the element
    var name = names[_random.nextInt(names.length)];
    var idToShow =
        (userId == notification.responderUid) ? name : currentUser.username;

    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 20, 15),
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("heello"),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '${idToShow!}' + "",

                        // style: TextStyle(fontSize: 14),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '${activityToString(getRequestByUid(notification.requestUid!).activity!)}',
                        // style: TextStyle(fontSize: 20),
                      ),
                    ),

                  ],
                ),
              ),
              Spacer(),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Image.asset(
                  activityImagePath(
                      getRequestByUid(notification.requestUid!).activity!),
                  height: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
