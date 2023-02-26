import 'package:pss_m/core/models/Doctor/doctor.dart';

class Event {
  final String slotId;
  final String startTime;
  final String endTime;
  final String date;
  final bool status;
  final Doctor doctor;
  const Event({
    required this.slotId,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.status,
    required this.doctor,
  });
}
