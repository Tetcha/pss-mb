import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pss_m/core/models/Doctor/doctor.dart';

part 'slot.g.dart';

@JsonSerializable()
class Slot {
  String id;
  String createAt;
  String updateAt;
  String startTime;
  String endTime;
  String date;
  bool status;
  Doctor doctor;

  Slot({
    required this.id,
    required this.createAt,
    required this.updateAt,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.status,
    required this.doctor,
  });

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);

  /// Connect the generated [_$SlotToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = _$SlotToJson(this);
    return json;
  }
}
