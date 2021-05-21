import 'package:flutter/material.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/request.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/models/app_user.dart';
import 'package:flutter_app/services/user_service.dart';
import 'package:flutter_app/utils/firebase_utils.dart';

class RequestListItemNotifications extends StatelessWidget {
  final Request request;

  RequestListItemNotifications.dart(this.request);

  @override
  Widget build(BuildContext context) {
    var srv = locator<UserService>();
    return FutureBuilder(
      future: srv.getUser(request.uid!),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.hasData) {
          var user = snapshot.data as AppUser;
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
                              '${user.username}' + "",

                              // style: TextStyle(fontSize: 14),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              '${activityToString(request.activity!)}',
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
                        activityImagePath(request.activity!),
                        height: 30,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return Text("hello");
        }
      },
    );
  }
}
