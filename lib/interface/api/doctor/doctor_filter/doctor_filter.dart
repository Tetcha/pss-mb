import 'package:json_annotation/json_annotation.dart';
import 'package:pss_m/core/constants/enum.dart';

part 'doctor_filter.g.dart';

@JsonSerializable()
class DoctorFilterPayload {
  final int currentPage;
  final int pageSize;
  final Oder? order;
  final String? orderBy;
  final String? name;
  final String? phone;
  final String? username;

  DoctorFilterPayload({
    required this.currentPage,
    required this.pageSize,
    this.order,
    this.orderBy,
    this.name,
    this.phone,
    this.username,
  });

  factory DoctorFilterPayload.fromJson(Map<String, dynamic> json) =>
      _$DoctorFilterPayloadFromJson(json);

  /// Connect the generated [_$DoctorFilterPayloadToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = _$DoctorFilterPayloadToJson(this);
    json['order'] = order.toString().split(".").last;
    return json;
  }
}
