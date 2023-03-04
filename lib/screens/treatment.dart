import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/MyTreatment.controller.dart';
import 'package:pss_m/core/constants/enum.dart';
import 'package:pss_m/util/date.dart';
import 'package:pss_m/util/string.dart';

class MyTreatmentScreen extends StatelessWidget {
  const MyTreatmentScreen({super.key});

  Widget _renderTreatmentStatus(BookingStatus status) {
    switch (status) {
      case BookingStatus.PENDING:
        return Column(
          children: const [
            Icon(
              Icons.access_time,
              color: Colors.orange,
            ),
            SizedBox(height: 8.0),
            Text(
              'Pending',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        );
      case BookingStatus.ACCEPTED:
        return Column(
          children: const [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(height: 8.0),
            Text(
              'Accepted',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        );
      case BookingStatus.REJECTED:
        return Column(
          children: const [
            Icon(Icons.cancel, color: Colors.red),
            SizedBox(height: 8.0),
            Text(
              'Rejected',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        );
      default:
        return const Icon(Icons.access_time, color: Colors.orange);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyTreatmentController>(
        init: MyTreatmentController(),
        builder: ((_) => Column(
              children: _.myBookingList
                  .map(
                    (e) => Card(
                      child: ListTile(
                        title: Text(
                            "Date: ${DateUtil.serverStringToText(e.slot?.date)}"),
                        leading: _renderTreatmentStatus(e.status),
                        onTap: () => _.onBookingTap(e),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8.0),
                            Text(
                                'Time: ${e.slot?.startTime.toUpperCase()} - ${e.slot?.endTime.toUpperCase()}'),
                            const SizedBox(height: 8.0),
                            Text('Cost: ${StringUtil.formatCurrency(e.cost)}'),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )));
  }
}
