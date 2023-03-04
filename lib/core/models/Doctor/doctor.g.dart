// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Doctor _$$_DoctorFromJson(Map<String, dynamic> json) => _$_Doctor(
      id: json['id'] as String,
      name: json['name'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      balance: (json['balance'] as num).toDouble(),
      avatar: json['avatar'] as String? ??
          "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
      isActive: json['isActive'] as bool,
      birthday: json['birthday'] as String,
      createAt: json['createAt'] as String,
      updateAt: json['updateAt'] as String,
      username: json['username'] as String,
      phone: json['phone'] as String,
      briefInfo:
          json['briefInfo'] as String? ?? "Doctor have not set the intro yet! ",
    );

Map<String, dynamic> _$$_DoctorToJson(_$_Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': _$GenderEnumMap[instance.gender]!,
      'balance': instance.balance,
      'avatar': instance.avatar,
      'isActive': instance.isActive,
      'birthday': instance.birthday,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'username': instance.username,
      'phone': instance.phone,
      'briefInfo': instance.briefInfo,
    };

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
  Gender.OTHERS: 'OTHERS',
};
