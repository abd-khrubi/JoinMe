import 'package:flutter/material.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/request.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/models/app_user.dart';
import 'package:flutter_app/models/user_notification.dart';
import 'package:flutter_app/services/notification_service.dart';
import 'package:flutter_app/services/request_service.dart';
import 'package:flutter_app/services/user_service.dart';
import 'package:flutter_app/utils/firebase_utils.dart';
import 'package:uuid/uuid.dart';

class RequestListItem extends StatelessWidget {
  final Request request;

  RequestListItem(this.request);

  _acceptRequest() {
    var uuid = Uuid();
    var uid = uuid.v1();
    var user = getCurrentUser();
    UserNotification userNotifocation =
        new UserNotification(uid, request.uid, user.uid);

    NotificationService srvs = locator<NotificationService>();
    srvs.saveRequest(userNotifocation);

    // RequestService reqSrvs = locator<RequestService>();
    // reqSrvs.deleteRequest(request.uid!);
  }

  _declineRequest() {
    // RequestService reqSrvs = locator<RequestService>();
    // reqSrvs.deleteRequest(request.uid!);
  }

  @override
  Widget build(BuildContext context) {
    var srv = locator<UserService>();
    return FutureBuilder(
      future: srv.getUser(request.requesterUid!),
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
                  //TODO : CHANGE
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        _acceptRequest();
                      },
                      icon: Icon(
                        Icons.check,
                        size: 40,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        _declineRequest();
                      },
                      icon: Icon(
                        Icons.clear,
                        size: 40,
                        color: Colors.red,
                      ),
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
