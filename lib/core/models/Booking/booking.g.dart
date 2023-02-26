// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Booking _$$_BookingFromJson(Map<String, dynamic> json) => _$_Booking(
      id: json['id'] as String,
      createAt: json['createAt'] as String,
      updateAt: json['updateAt'] as String,
      cost: (json['cost'] as num).toDouble(),
      status: $enumDecode(_$BookingStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_BookingToJson(_$_Booking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'cost': instance.cost,
      'status': _$BookingStatusEnumMap[instance.status]!,
    };

const _$BookingStatusEnumMap = {
  BookingStatus.PENDING: 'PENDING',
  BookingStatus.ACCEPTED: 'ACCEPTED',
  BookingStatus.REJECTED: 'REJECTED',
};
