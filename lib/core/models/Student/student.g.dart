// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Student _$$_StudentFromJson(Map<String, dynamic> json) => _$_Student(
      id: json['id'] as String,
      birthday: json['birthday'] as String?,
      studentCode: json['studentCode'] as String?,
      phone: json['phone'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      balance: (json['balance'] as num).toDouble(),
      name: json['name'] as String,
      email: json['email'] as String?,
      isActive: json['isActive'] as bool,
      createAt: json['createAt'] as String?,
      updateAt: json['updateAt'] as String?,
    );

Map<String, dynamic> _$$_StudentToJson(_$_Student instance) =>
    <String, dynamic>{
      'id': instance.id,
      'birthday': instance.birthday,
      'studentCode': instance.studentCode,
      'phone': instance.phone,
      'gender': _$GenderEnumMap[instance.gender],
      'balance': instance.balance,
      'name': instance.name,
      'email': instance.email,
      'isActive': instance.isActive,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
    };

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
};
