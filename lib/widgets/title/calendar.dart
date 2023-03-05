int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

const int scheduleRange = 2;
final kToday = DateTime.now().toLocal();
final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day).toLocal();
final kLastDay =
    DateTime(kToday.year, kToday.month + scheduleRange, kToday.day).toLocal();
