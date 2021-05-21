// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
    json['uid'] as String?,
    json['requestUid'] as String?,
    json['responderUid'] as String?,
  );
}

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'requestUid': instance.requestUid,
      'responderUid': instance.responderUid,
    };
