import 'package:json_annotation/json_annotation.dart';

part 'user_notification.g.dart';

@JsonSerializable()
class UserNotification {
  String? uid;
  String? requestUid;
  String? responderUid;


  UserNotification(this.uid, this.requestUid, this.responderUid);

  factory UserNotification.fromJson(Map<String, dynamic> json) =>
      _$UserNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$UserNotificationToJson(this);
}
