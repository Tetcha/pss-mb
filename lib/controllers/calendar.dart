import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pss_m/interface/api/slot/slot.dart';
import 'package:pss_m/interface/calendar/calendar.dart';
import 'package:pss_m/screens/book_form.dart';
import 'package:pss_m/util/date.dart';
import 'package:pss_m/widgets/title/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  List<Slot> data;

  late final ValueNotifier<List<Event>> selectedEvents;
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  final kEvents = LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  Map<DateTime, List<Event>> convertSlotsToEvents(List<Slot> slots) {
    Map<DateTime, List<Event>> data = {};
    slots.forEach((slot) {
      DateTime date = DateUtil.serverStringToDate(slot.date);
      // NOTE: if the slots have booking is more than 1
      // it will be shown as unavailable (because someone has booked it)
      if (data.containsKey(date)) {
        data[date]!.add(Event(
          slotId: slot.id,
          startTime: slot.startTime,
          endTime: slot.endTime,
          date: slot.date,
          status: slot.booking.isEmpty ? true : false,
          doctor: slot.doctor,
        ));
      } else {
        data[date] = [
          Event(
            slotId: slot.id,
            startTime: slot.startTime,
            endTime: slot.endTime,
            date: slot.date,
            status: slot.booking.isEmpty ? true : false,
            doctor: slot.doctor,
          )
        ];
      }
    });
    return data;
  }

  CalendarController({required this.data}) {
    kEvents.addAll(convertSlotsToEvents(data));
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
    return kEvents[day]?.toList() ?? [];
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

  void onBookingPressed(Event event) {
    Get.to(() => BookFormScreen(currentEvent: event));
  }
}
