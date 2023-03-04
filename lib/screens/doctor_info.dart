import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pss_m/widgets/layout/empty.dart';

class DoctorInfo extends StatelessWidget {
  final String doctorId;
  const DoctorInfo({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    return EmptyLayout(
        children: Column(
      children: [
        Text('doctor data'),
      ],
    ));
  }
}
