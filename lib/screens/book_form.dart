import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/book_form.controller.dart';
import 'package:pss_m/interface/calendar/calendar.dart';

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
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'age',
                  decoration:
                      InputDecoration(labelText: 'Name', errorText: "errorrrr"),
                  onChanged: (value) {
                    print(value);
                  },
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: () {
                    print(_.controller.text);
                  },
                  child: const Text("Submit"),
                )
              ],
            )),
      ),
    );
  }
}
