import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pss_m/core/constants/enum.dart';

part 'doctor.freezed.dart';
part 'doctor.g.dart';

@freezed
class Doctor with _$Doctor {
  const factory Doctor({
    required String id,
    required String birthday,
    required String phone,
    required String username,
    @Default("https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80")
        String? avatar,
    @Default("Doctor have not set the intro yet! ") String? briefInfo,
    required Gender gender,
    required double balance,
    required String name,
    required bool isActive,
    required String createAt,
    required String updateAt,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}
