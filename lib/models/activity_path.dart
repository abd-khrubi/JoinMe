import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/models/activity.dart';

class ActivityPath {
  Activity pathActivity;
  Campus pathCampus;
  String pathName;
  double pathLength;
  StatefulWidget widget;


  ActivityPath(
      this.pathActivity, this.pathCampus, this.pathName, this.pathLength, this.widget);

// TODO
// Geo location
}
