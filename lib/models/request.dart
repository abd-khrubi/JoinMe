import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class Request {
  String? uid;
  Activity? activity;
  Campus? campus;

  DateTime timeFrom;
  DateTime timeTo;

  Request(this.uid, this.activity, this.campus, this.timeFrom, this.timeTo);

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  toJson() => _$RequestToJson(this);

  @override
  String toString() {
    return 'Request{uid: $uid, activity: $activity, campus: $campus, timeFrom: $timeFrom, timeTo: $timeTo}';
  }
}
