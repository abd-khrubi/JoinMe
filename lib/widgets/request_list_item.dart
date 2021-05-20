import 'package:flutter/material.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/request.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/user_service.dart';


class RequestListItem extends StatelessWidget {
  final Request request;

  RequestListItem(this.request);

  @override
  Widget build(BuildContext context) {
    var userSrv = locator<UserService>();
    //TODO change this
    Future<User> user = userSrv.getUser("lmLvoGDT3aNNQQ0LZjEh");

    return FutureBuilder(
      future: user,
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.hasData) {
          return Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(20),
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

            child: Row(
              children: [
                CircleAvatar(radius: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("heello"),
                    Text('${snapshot.data.username}'),
                    Text('${activityToString(request.activity)}'),
                  ],
                ),
                // Image.asset("assets/images/basketball.png"),
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
