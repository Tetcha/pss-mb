import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pss_m/core/constants/enum.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

@freezed
class Booking with _$Booking {
  const factory Booking({
    required String id,
    required String createAt,
    required String updateAt,
    required double cost,
    required BookingStatus status,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
}
