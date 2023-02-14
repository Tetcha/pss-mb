// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorFilterPayload _$DoctorFilterPayloadFromJson(Map<String, dynamic> json) =>
    DoctorFilterPayload(
      currentPage: json['currentPage'] as int,
      pageSize: json['pageSize'] as int,
      order: $enumDecodeNullable(_$OderEnumMap, json['order']),
      orderBy: json['orderBy'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$DoctorFilterPayloadToJson(
        DoctorFilterPayload instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'order': _$OderEnumMap[instance.order],
      'orderBy': instance.orderBy,
      'name': instance.name,
      'phone': instance.phone,
      'username': instance.username,
    };

const _$OderEnumMap = {
  Oder.ASC: 'ASC',
  Oder.DESC: 'DESC',
};
