// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return AppUser(
    json['uid'] as String?,
    json['email'] as String?,
    json['username'] as String?,
    json['phoneNumber'] as String?,
    json['imageUid'] as String?,
    (json['preferredCampuses'] as List<dynamic>)
        .map((e) => _$enumDecode(_$CampusEnumMap, e))
        .toSet(),
    (json['favoriteSports'] as List<dynamic>)
        .map((e) => _$enumDecode(_$ActivityEnumMap, e))
        .toSet(),
  );
}

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'username': instance.username,
      'phoneNumber': instance.phoneNumber,
      'imageUid': instance.imageUid,
      'preferredCampuses':
          instance.preferredCampuses.map((e) => _$CampusEnumMap[e]).toList(),
      'favoriteSports':
          instance.favoriteSports.map((e) => _$ActivityEnumMap[e]).toList(),
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

const _$CampusEnumMap = {
  Campus.har: 'har',
  Campus.givat: 'givat',
  Campus.ein_karem: 'ein_karem',
  Campus.rahovot: 'rahovot',
};

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
