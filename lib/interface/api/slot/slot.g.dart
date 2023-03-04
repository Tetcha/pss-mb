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
      doctor: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      booking: (json['booking'] as List<dynamic>?)
          ?.map((e) => Booking.fromJson(e as Map<String, dynamic>))
          .toList(),
      slotEnumId: json['slotEnumId'] as int?,
    );

Map<String, dynamic> _$SlotToJson(Slot instance) => <String, dynamic>{
      'id': instance.id,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'date': instance.date,
      'doctor': instance.doctor,
      'booking': instance.booking,
      'slotEnumId': instance.slotEnumId,
    };
