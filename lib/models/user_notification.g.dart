// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserNotification _$UserNotificationFromJson(Map<String, dynamic> json) {
  return UserNotification(
    json['uid'] as String?,
    json['requestUid'] as String?,
    json['responderUid'] as String?,
  );
}

Map<String, dynamic> _$UserNotificationToJson(UserNotification instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'requestUid': instance.requestUid,
      'responderUid': instance.responderUid,
    };
