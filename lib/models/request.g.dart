// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) {
  return Request(
    json['uid'] as String?,
    _$enumDecode(_$ActivityEnumMap, json['activity']),
    _$enumDecode(_$CampusEnumMap, json['campus']),
    DateTime.parse(json['timeFrom'] as String),
    DateTime.parse(json['timeTo'] as String),
  );
}

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'uid': instance.uid,
      'activity': _$ActivityEnumMap[instance.activity],
      'campus': _$CampusEnumMap[instance.campus],
      'timeFrom': instance.timeFrom.toIso8601String(),
      'timeTo': instance.timeTo.toIso8601String(),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$ActivityEnumMap = {
  Activity.basketball: 'basketball',
  Activity.chess: 'chess',
  Activity.football: 'football',
  Activity.running: 'running',
};

const _$CampusEnumMap = {
  Campus.har: 'har',
  Campus.givat: 'givat',
  Campus.ein_karem: 'ein_karem',
  Campus.rahovot: 'rahovot',
};
