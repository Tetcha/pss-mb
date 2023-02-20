// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Slot _$SlotFromJson(Map<String, dynamic> json) => Slot(
      id: json['id'] as String,
      createAt: json['createAt'] as String,
      updateAt: json['updateAt'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      date: json['date'] as String,
      status: json['status'] as bool,
      doctor: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SlotToJson(Slot instance) => <String, dynamic>{
      'id': instance.id,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'date': instance.date,
      'status': instance.status,
      'doctor': instance.doctor,
    };
