import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/calendar.dart';
import 'package:pss_m/interface/api/slot/slot.dart';
import 'package:pss_m/interface/calendar/calendar.dart';
import 'package:pss_m/widgets/title/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final List<Slot> data;
  const Calendar({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
      init: CalendarController(data: data),
      builder: (controller) => Column(
        children: [
          TableCalendar<Event>(
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) {
                int numberOfEvents =
                    events.where((element) => element.status == true).length;
                if (numberOfEvents > 3) {
                  numberOfEvents = 3;
                }
                return events.isEmpty
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(numberOfEvents, (index) => 0)
                            .map(
                              (e) => Container(
                                margin: const EdgeInsets.all(2.0),
                                width: 7.0,
                                height: 7.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              ),
                            )
                            .toList(),
                      );
              },
            ),
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
                          bool isAvailable = currentValue.status;
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
                                isAvailable == true ? "Available" : "Busy",
                                style: TextStyle(
                                  color:
                                      isAvailable ? Colors.green : Colors.grey,
                                ),
                              ),
                              trailing: isAvailable
                                  ? ElevatedButton(
                                      onPressed: () => controller
                                          .onBookingPressed(currentValue),
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
    );
  }
}
