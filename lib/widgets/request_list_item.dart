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
                          Text(
                            '${(snapshot.data! as User).username}',
                            style: TextStyle(fontSize: 26),
                          ),
                          Text(
                            '${activityToString(request.activity)}',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      activityImagePath(request.activity),
                      height: 30,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check,
                        size: 40,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(width: 20,),
                    IconButton(
                      onPressed: () {},
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
