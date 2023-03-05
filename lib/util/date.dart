import 'package:intl/intl.dart';

class DateUtil {
  static DateTime fromString(String date) {
    var inputFormat = DateFormat('MM/dd/yyyy');
    return inputFormat.parse(date).toLocal();
  }

  static String toText(DateTime date) {
    var outputFormat = DateFormat('MM/dd/yyyy');
    return outputFormat.format(date.toLocal());
  }

  static DateTime serverStringToDate(String date) {
    return DateTime.parse(date).toLocal();
  }

  static String serverStringToText(String? date) {
    if (date == null) return '';

    DateTime dateTime = serverStringToDate(date);
    var outputFormat = DateFormat('MM/dd/yyyy');
    return outputFormat.format(dateTime.toLocal());
  }

  static int calculateAgeWithServerString(String? date) {
    if (date == null) return 0;

    DateTime dateTime = serverStringToDate(date);
    return calculateAge(dateTime);
  }

  static int calculateAge(DateTime birthday) {
    final now = DateTime.now();
    int age = now.year - birthday.year;
    if (now.month < birthday.month ||
        (now.month == birthday.month && now.day < birthday.day)) {
      age--;
    }
    return age;
  }
}
