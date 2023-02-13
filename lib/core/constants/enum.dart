import 'package:json_annotation/json_annotation.dart';

enum Gender {
  @JsonValue('MALE')
  MALE,
  @JsonValue('FEMALE')
  FEMALE
}

enum LoginType {
  @JsonValue('GOOGLE')
  GOOGLE,
  @JsonValue('FACEBOOK')
  FACEBOOK
}
