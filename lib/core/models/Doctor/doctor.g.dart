// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Doctor _$$_DoctorFromJson(Map<String, dynamic> json) => _$_Doctor(
      id: json['id'] as String,
      createAt: json['createAt'] as String,
      updateAt: json['updateAt'] as String,
      birthday: json['birthday'] as String,
      phone: json['phone'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      balance: (json['balance'] as num).toDouble(),
      status: json['status'] as bool,
      name: json['name'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String,
      introduction: json['introduction'] as String,
      googleId: json['googleId'] as String? ?? "",
      facebookId: json['facebookId'] as String? ?? "",
    );

Map<String, dynamic> _$$_DoctorToJson(_$_Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'birthday': instance.birthday,
      'phone': instance.phone,
      'gender': _$GenderEnumMap[instance.gender]!,
      'balance': instance.balance,
      'status': instance.status,
      'name': instance.name,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'introduction': instance.introduction,
      'googleId': instance.googleId,
      'facebookId': instance.facebookId,
    };

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
};
