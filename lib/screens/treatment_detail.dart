import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/treatment_detail.controller.dart';
import 'package:pss_m/core/constants/enum.dart';
import 'package:pss_m/core/models/Booking/booking.dart';
import 'package:pss_m/util/date.dart';
import 'package:pss_m/util/string.dart';
import 'package:pss_m/widgets/table_question/table.dart';

class TreatmentDetail extends StatelessWidget {
  final Booking booking;
  const TreatmentDetail({super.key, required this.booking});
  final double iconSize = 150;
  final double statusTextSize = 25;

  Widget _renderStatusUI({
    required Widget icon,
    required String status,
    Color? bgColor = const Color(0xFFF2F3F2),
  }) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipPath(
        clipper: MyClipper(),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: bgColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(height: 8.0),
              Text(
                status,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: statusTextSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderTreatmentFactory(BookingStatus status) {
    switch (status) {
      case BookingStatus.PENDING:
        return _renderStatusUI(
          bgColor: Colors.orange[50],
          icon: Icon(
            Icons.access_time,
            color: Colors.orange,
            size: iconSize,
          ),
          status: 'Pending',
        );

      case BookingStatus.ACCEPTED:
        return _renderStatusUI(
          bgColor: Colors.green[50],
          icon: Icon(
            Icons.check_circle,
            color: Colors.green,
            size: iconSize,
          ),
          status: 'Accepted',
        );

      case BookingStatus.REJECTED:
        return _renderStatusUI(
          bgColor: Colors.red[50],
          icon: Icon(
            Icons.cancel,
            color: Colors.red,
            size: iconSize,
          ),
          status: 'Rejected',
        );
      default:
        return const Icon(Icons.access_time, color: Colors.orange);
    }
  }

  Widget _renderInfoLine(
      {required String title, String? value, Widget? valueWidget}) {
    return Row(
      children: [
        Text(
          "$title:",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: valueWidget ??
              Text(
                value ?? "unknown",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treatment Detail'),
      ),
      body: GetBuilder<TreatmentDetailController>(
        init: TreatmentDetailController(booking: booking),
        builder: (_) => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _renderTreatmentFactory(booking.status),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Title(
                            color: Colors.black,
                            child: Text(
                              'Treatment Detail',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          _renderInfoLine(
                            title: 'Date',
                            value:
                                DateUtil.serverStringToText(booking.slot?.date),
                          ),
                          const SizedBox(height: 10),
                          _renderInfoLine(
                            title: 'Start time',
                            value: booking.slot?.startTime.toUpperCase(),
                          ),
                          const SizedBox(height: 10),
                          _renderInfoLine(
                            title: 'End time',
                            value: booking.slot?.endTime.toUpperCase(),
                          ),
                          const SizedBox(height: 10),
                          _renderInfoLine(
                            title: 'Cost',
                            value: StringUtil.formatCurrency(booking.cost),
                          ),
                          const SizedBox(height: 10),
                          _renderInfoLine(
                            title: 'Doctor',
                            valueWidget: GestureDetector(
                              onTap: () => _.onDoctorTap(booking.slot?.doctor),
                              child: Text(
                                booking.slot?.doctor.name ?? "unknown",
                                style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Title(
                            color: Colors.black,
                            child: Text(
                              'Your questions',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TableQuestion(data: booking.questions),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: _.onJoinMeetingTap,
                    child: const Text('Join the meeting'),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
