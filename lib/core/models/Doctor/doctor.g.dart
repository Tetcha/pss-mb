// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Doctor _$$_DoctorFromJson(Map<String, dynamic> json) => _$_Doctor(
      id: json['id'] as String,
      birthday: json['birthday'] as String,
      phone: json['phone'] as String,
      username: json['username'] as String,
      avatar: json['avatar'] as String? ??
          "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
      briefInfo:
          json['briefInfo'] as String? ?? "Doctor have not set the intro yet! ",
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      balance: (json['balance'] as num).toDouble(),
      name: json['name'] as String,
      isActive: json['isActive'] as bool,
      createAt: json['createAt'] as String,
      updateAt: json['updateAt'] as String,
    );

Map<String, dynamic> _$$_DoctorToJson(_$_Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'birthday': instance.birthday,
      'phone': instance.phone,
      'username': instance.username,
      'avatar': instance.avatar,
      'briefInfo': instance.briefInfo,
      'gender': _$GenderEnumMap[instance.gender]!,
      'balance': instance.balance,
      'name': instance.name,
      'isActive': instance.isActive,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
    };

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
  Gender.OTHERS: 'OTHERS',
};
