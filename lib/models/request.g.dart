// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) {
  return Request(
    json['uid'] as String?,
    json['requesterUid'] as String?,
    _$enumDecodeNullable(_$ActivityEnumMap, json['activity']),
    _$enumDecodeNullable(_$CampusEnumMap, json['campus']),
    DateTime.parse(json['timeFrom'] as String),
    DateTime.parse(json['timeTo'] as String),
  );
}

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'uid': instance.uid,
      'requesterUid': instance.requesterUid,
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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$ActivityEnumMap = {
  Activity.basketball: 'basketball',
  Activity.chess: 'chess',
  Activity.cycling: 'cycling',
  Activity.working_out: 'working_out',
  Activity.running: 'running',
  Activity.skipping_rope: 'skipping_rope',
  Activity.swimming: 'swimming',
  Activity.football: 'football',
};

const _$CampusEnumMap = {
  Campus.har: 'har',
  Campus.givat: 'givat',
  Campus.ein_karem: 'ein_karem',
  Campus.rahovot: 'rahovot',
};
