int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final int scheduleRange = 3;
final kToday = DateTime.now();
final kFirstDay =
    DateTime(kToday.year, kToday.month - scheduleRange, kToday.day);
final kLastDay =
    DateTime(kToday.year, kToday.month + scheduleRange, kToday.day);
