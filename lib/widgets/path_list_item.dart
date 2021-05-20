import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/activity_path.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/screens/google_map_screen.dart';

class PathListItem extends StatelessWidget {
  late final ActivityPath path;

  PathListItem(this.path);

  @override
  Widget build(BuildContext context) {
    print(path.pathLength.toString());
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
      child: Row(
        children: [
          Image.asset(
            activityImagePath(path.pathActivity),
            height: 50,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  path.pathName,
                  style: TextStyle(fontSize: 18),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 5,
                ),
                Text("${path.pathLength.toString()} KM"),
                // Text(
                //   path.pathName,
                //   style: TextStyle(fontSize: 26),
                // ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GoogleMapScreen()));
              },
              icon: Icon(
                Icons.directions,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
