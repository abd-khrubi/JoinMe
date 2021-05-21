import 'package:flutter/material.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/activity_path.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/screens/maps/ChessMapRam.dart';
import 'package:flutter_app/screens/maps/chess_map_2.dart';
import 'package:flutter_app/screens/maps/running_map_1.dart';
import 'package:flutter_app/screens/maps/running_map_har.dart';
import 'package:flutter_app/widgets/path_list_item.dart';

import 'maps/running_map_2.dart';

class ChoosePathScreen extends StatefulWidget {
  final Activity activity;
  final Campus campus;

  ChoosePathScreen(this.activity, this.campus);

  @override
  _ChoosePathScreenState createState() => _ChoosePathScreenState();
}

class _ChoosePathScreenState extends State<ChoosePathScreen> {
  @override
  Widget build(BuildContext context) {
    List<ActivityPath> filteredList = [];
    ActivityPath ChessGivat = ActivityPath(
        Activity.chess, Campus.givat, "Givat Ram Chess   ", 12.0, ChessMapRam());

    ActivityPath ChessHar = ActivityPath(
        Activity.chess, Campus.har, "Mount Scopus Chess ", 16.0,ChessMap2());

    ActivityPath RunningHar = ActivityPath(
        Activity.running, Campus.har, "Har Running Path", 9.0,RunningMapHar());

    ActivityPath RunningGivat = ActivityPath(
        Activity.running, Campus.givat, "Givat Ram Running Path", 12.0,RunningMap1());

    ActivityPath RunningGivat2 = ActivityPath(
        Activity.running, Campus.givat, "Givat Ram Running Path", 10.0,RunningMap2());


    List<ActivityPath> pathsList = [ChessGivat, ChessHar, RunningHar, RunningGivat,RunningGivat2];

    filteredList = pathsList
        .where((element) => ((element.pathActivity == widget.activity) &&
            (element.pathCampus == widget.campus)))
        .toList();

    print(filteredList);

    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Path"),
      ),
      body: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          return PathListItem(filteredList[index]);
        },
      ),
    );
  }
}
