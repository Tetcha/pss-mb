// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateStudentPayload _$UpdateStudentPayloadFromJson(
        Map<String, dynamic> json) =>
    UpdateStudentPayload(
      name: json['name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      birthday: json['birthday'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      studentCode: json['studentCode'] as String?,
    );

Map<String, dynamic> _$UpdateStudentPayloadToJson(
        UpdateStudentPayload instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'birthday': instance.birthday,
      'gender': _$GenderEnumMap[instance.gender],
      'studentCode': instance.studentCode,
    };

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
};
