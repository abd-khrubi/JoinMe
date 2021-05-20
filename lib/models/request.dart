import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/models/activity.dart';

class Request {
  String uid;
  Activity activity;
  Campus campus;

  DateTime timeFrom;
  DateTime timeTo;

  Request(this.uid, this.activity, this.campus, this.timeFrom, this.timeTo);

}