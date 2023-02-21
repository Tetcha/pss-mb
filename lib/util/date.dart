import 'package:intl/intl.dart';

class DateUtil {
  static DateTime fromString(String date) {
    var inputFormat = DateFormat('MM/dd/yyyy');
    return inputFormat.parse(date);
  }

  static String toText(DateTime date) {
    var outputFormat = DateFormat('MM/dd/yyyy');
    return outputFormat.format(date.toLocal());
  }

  static DateTime serverStringToDate(String date) {
    return DateTime.parse(date);
  }

  static String serverStringToText(String date) {
    DateTime dateTime = serverStringToDate(date);
    var outputFormat = DateFormat('MM/dd/yyyy');
    return outputFormat.format(dateTime.toLocal());
  }
}
