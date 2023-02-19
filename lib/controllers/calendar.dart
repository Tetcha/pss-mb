import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pss_m/interface/calendar/calendar.dart';
import 'package:pss_m/util/date.dart';
import 'package:pss_m/widgets/title/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  late final ValueNotifier<List<Event>> selectedEvents;
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  final kEvents = LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
  )..addAll({
      DateTime.now(): [
        const Event(
          slot: "1",
          startTime: "7:00",
          endTime: "8:00",
          date: "2/19/2023",
          status: "Available",
        ),
        const Event(
          slot: "1",
          startTime: "8:00",
          endTime: "9:00",
          date: "2/19/2023",
          status: "Unavailable",
        ),
        const Event(
          slot: "1",
          startTime: "9:00",
          endTime: "10:00",
          date: "2/19/2023",
          status: "Unavailable",
        ),
        const Event(
          slot: "1",
          startTime: "10:00",
          endTime: "11:00",
          date: "2/19/2023",
          status: "Unavailable",
        ),
        const Event(
          slot: "1",
          startTime: "11:00",
          endTime: "12:00",
          date: "2/19/2023",
          status: "Unavailable",
        ),
      ],
      DateUtil.fromString("2/24/2023"): [
        const Event(
          slot: "1",
          startTime: "8:00",
          endTime: "9:00",
          date: "2/19/2023",
          status: "Unavailable",
        ),
      ],
    });

  @override
  void onInit() {
    super.onInit();
    selectedDay = focusedDay;
    selectedEvents = ValueNotifier(getEventsForDay(selectedDay!));
    update();
  }

  @override
  void dispose() {
    selectedEvents.dispose();
    super.dispose();
  }

  List<Event> getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day]?.take(2).toList() ?? [];
  }

  void onFormatChange(CalendarFormat format) {
    if (calendarFormat != format) {
      // setState(() {
      calendarFormat = format;
      // });
    }
    update();
  }

  void onDaySelected(DateTime newSelectedDay, DateTime newFocusDay) {
    if (!isSameDay(selectedDay, newSelectedDay)) {
      // update
      selectedDay = newSelectedDay;
      focusedDay = newFocusDay;

      selectedEvents.value = getEventsForDay(newSelectedDay);
    }
    update();
  }
}
