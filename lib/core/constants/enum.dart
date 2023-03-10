import 'package:json_annotation/json_annotation.dart';

enum Gender {
  @JsonValue('MALE')
  MALE,
  @JsonValue('FEMALE')
  FEMALE,
  @JsonValue('OTHERS')
  OTHERS
}

enum LoginType {
  @JsonValue('GOOGLE')
  GOOGLE,
  @JsonValue('FACEBOOK')
  FACEBOOK
}

enum Oder {
  @JsonValue('ASC')
  ASC,
  @JsonValue('DESC')
  DESC
}

enum BookingStatus {
  @JsonValue('PENDING')
  PENDING,
  @JsonValue('ACCEPTED')
  ACCEPTED,
  @JsonValue('REJECTED')
  REJECTED,
}
