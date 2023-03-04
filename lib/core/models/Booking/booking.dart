import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pss_m/core/constants/enum.dart';
import 'package:pss_m/core/models/Question/question.dart';
import 'package:pss_m/core/models/Student/student.dart';
import 'package:pss_m/interface/api/slot/slot.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

@freezed
class Booking with _$Booking {
  const factory Booking({
    required String id,
    required double cost,
    required BookingStatus status,
    required Slot? slot,
    required Student? student,
    required List<Question> questions,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
}
