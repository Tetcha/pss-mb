// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Booking _$$_BookingFromJson(Map<String, dynamic> json) => _$_Booking(
      id: json['id'] as String,
      cost: (json['cost'] as num).toDouble(),
      status: $enumDecode(_$BookingStatusEnumMap, json['status']),
      slot: json['slot'] == null
          ? null
          : Slot.fromJson(json['slot'] as Map<String, dynamic>),
      student: json['student'] == null
          ? null
          : Student.fromJson(json['student'] as Map<String, dynamic>),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BookingToJson(_$_Booking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cost': instance.cost,
      'status': _$BookingStatusEnumMap[instance.status]!,
      'slot': instance.slot,
      'student': instance.student,
      'questions': instance.questions,
    };

const _$BookingStatusEnumMap = {
  BookingStatus.PENDING: 'PENDING',
  BookingStatus.ACCEPTED: 'ACCEPTED',
  BookingStatus.REJECTED: 'REJECTED',
};
