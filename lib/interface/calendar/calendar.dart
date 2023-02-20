class Event {
  final String slotId;
  final String startTime;
  final String endTime;
  final String date;
  final bool status;

  const Event({
    required this.slotId,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.status,
  });
}
