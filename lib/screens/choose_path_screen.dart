import 'package:flutter/material.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/activity_path.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/widgets/path_list_item.dart';

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
    ActivityPath path1 = ActivityPath(
        Activity.running, Campus.ein_karem, "Ein Karem Running Path", 12.0);

    ActivityPath path2 = ActivityPath(
        Activity.running, Campus.givat, "Givat Ram Running Path", 12.0);

    ActivityPath path3 = ActivityPath(
        Activity.running, Campus.har, "Har Running Path", 12.0);

    ActivityPath path4 = ActivityPath(
        Activity.running, Campus.rahovot, "Rahovot Running Path", 12.0);


    List<ActivityPath> pathsList = [path1, path2, path3, path4, path4];

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
