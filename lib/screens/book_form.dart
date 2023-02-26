import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/book_form.controller.dart';
import 'package:pss_m/core/form/date_field.dart';
import 'package:pss_m/core/form/text_field.dart';
import 'package:pss_m/interface/calendar/calendar.dart';
import 'package:pss_m/util/date.dart';

class BookFormScreen extends StatelessWidget {
  Event currentEvent;
  BookFormScreen({super.key, required this.currentEvent});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookFormController>(
      init: BookFormController(currentEvent: currentEvent),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("schedule"),
        ),
        body: SingleChildScrollView(
            child: FormBuilder(
                key: _.formKey,
                onChanged: _.onFormChange,
                skipDisabled: true,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFieldC(
                        name: "doctorName",
                        label: "Doctor in charge",
                        disabled: true,
                        initialValue: currentEvent.doctor.name,
                      ),
                      const SizedBox(height: 10),
                      TextFieldC(
                        label: "Name",
                        name: "name",
                        disabled: true,
                        initialValue: _.name,
                      ),
                      const SizedBox(height: 10),
                      DateField(
                        name: "date",
                        labelText: "Date",
                        initialValue:
                            DateUtil.serverStringToDate(currentEvent.date),
                        disabled: true,
                      ),
                      const SizedBox(height: 10),
                      TextFieldC(
                        name: "time",
                        label: "Time",
                        disabled: true,
                        initialValue:
                            "${currentEvent.startTime} - ${currentEvent.endTime}",
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List<int>.generate(
                            _.questionCount, (index) => index + 1).map((e) {
                          return TextFieldC(
                            label: "Question $e",
                            name: "question_$e",
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _.addQuestion,
                              child: const Text('Add question'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _.onSubmit,
                              child: const Text("Submit"),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ))),
      ),
    );
  }
}
