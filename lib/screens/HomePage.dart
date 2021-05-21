import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/app_user.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/models/request.dart';
import 'package:flutter_app/screens/ChooseCampusScreen.dart';
import 'package:flutter_app/screens/requests_screen.dart';
import 'package:flutter_app/widgets/MyDrawer.dart';
import 'package:flutter_app/widgets/request_list_item.dart';
import 'package:flutter_app/services/request_service.dart';

class HomePage extends StatelessWidget {
  AppUser usr;

  HomePage(this.usr);

  Request request = Request(
    '1',
    "hiiiiii",
    Activity.basketball,
    Campus.givat,
    DateTime.now(),
    DateTime.now(),
  );
  Request request2 = Request(
    '2',
    "hiiiiii",
    Activity.running,
    Campus.givat,
    DateTime.now(),
    DateTime.now(),
  );
  Request request3 = Request(
    '3',
    "hiiiiii",
    Activity.chess,
    Campus.givat,
    DateTime.now(),
    DateTime.now(),
  );
  Request request4 = Request(
    '4',
    "hiiiiii",
    Activity.football,
    Campus.givat,
    DateTime.now(),
    DateTime.now(),
  );

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
    RequestService srvs = locator<RequestService>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Welcome,  ' + usr.username! + "\n Check your notifications:"),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {
                //todo: open notifications screen
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Stack(children: [
          Container(
            height: 550,
            child: FutureBuilder(
              future: srvs.loadRequests(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Request> rList = snapshot.data as List<Request>;
                  print(rList.length);
                  return ListView.builder(
                    itemCount: rList.length,
                    itemBuilder: (context, index) {
                      return RequestListItem(rList[index]);
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
            // ListView.builder(
            //   itemCount: newList.length,
            //   itemBuilder: (context, index) {
            //     return RequestListItem(newList[index]);
            //   },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(top: 600),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
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
            ],
          )
        ]),
        drawer: MyDrawer(usr));
  }
}
