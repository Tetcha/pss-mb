import 'package:json_annotation/json_annotation.dart';
import 'package:pss_m/core/constants/enum.dart';

part 'update_student.g.dart';

@JsonSerializable()
class UpdateStudentPayload {
  final String name;
  final String? email;
  final String? phone;
  final String? birthday;
  final Gender? gender;
  final String? studentCode;
  UpdateStudentPayload({
    required this.name,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.gender,
    required this.studentCode,
  });

  factory UpdateStudentPayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateStudentPayloadFromJson(json);

  /// Connect the generated [_$UpdateStudentPayloadToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = _$UpdateStudentPayloadToJson(this);
    json['gender'] = gender.toString().split(".").last;
    return json;
  }
}
