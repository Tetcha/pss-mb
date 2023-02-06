import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pss_m/core/constants/enum.dart';

part 'doctor.freezed.dart';
part 'doctor.g.dart';

@freezed
class Doctor with _$Doctor {
  const factory Doctor({
    required String id,
    required String createAt,
    required String updateAt,
    required String birthday,
    required String phone,
    required Gender gender,
    required double balance,
    required bool status,
    required String name,
    required String email,
    // new
    required String photoUrl,
    required String introduction,
    @Default("") String googleId,
    @Default("") String facebookId,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}
