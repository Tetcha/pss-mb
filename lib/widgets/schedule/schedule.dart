import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/calendar.dart';
import 'package:pss_m/interface/calendar/calendar.dart';
import 'package:pss_m/widgets/title/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class DoctorSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dau Le Duc'),
        ),
        body: GetBuilder<CalendarController>(
          init: CalendarController(),
          builder: (controller) => Column(
            children: [
              TableCalendar<Event>(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: controller.focusedDay,
                selectedDayPredicate: (day) =>
                    isSameDay(controller.selectedDay, day),
                calendarFormat: controller.calendarFormat,
                eventLoader: controller.getEventsForDay,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: CalendarStyle(
                  // Use `CalendarStyle` to customize the UI
                  outsideDaysVisible: false,
                  todayDecoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: const TextStyle(color: Colors.white),
                  selectedDecoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                onDaySelected: controller.onDaySelected,
                onFormatChanged: controller.onFormatChange,
                onPageChanged: (focusedDay) {
                  controller.focusedDay = focusedDay;
                },
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: ValueListenableBuilder<List<Event>>(
                  valueListenable: controller.selectedEvents,
                  builder: (context, value, _) {
                    return value.isEmpty
                        ? const Center(
                            child: Text('Doctor is not available in this day.'),
                          )
                        : ListView.builder(
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              Event currentValue = value[index];
                              bool isAvailable =
                                  currentValue.status == "Available";
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: ListTile(
                                  title: Text(
                                    "Time: ${currentValue.startTime} - ${currentValue.endTime}",
                                  ),
                                  subtitle: Text(
                                    currentValue.status,
                                    style: TextStyle(
                                      color: isAvailable
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                  ),
                                  trailing: isAvailable
                                      ? ElevatedButton(
                                          onPressed: () {},
                                          child: const Text("Book"))
                                      : null,
                                ),
                              );
                            },
                          );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
