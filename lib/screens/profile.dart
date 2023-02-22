import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/profile.controller.dart';
import 'package:pss_m/core/constants/enum.dart';
import 'package:pss_m/core/form/date_field.dart';
import 'package:pss_m/core/form/radio_field.dart';
import 'package:pss_m/core/form/text_field_copy.dart';
import 'package:pss_m/util/date.dart';
import 'package:pss_m/widgets/layout/empty.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) => EmptyLayout(
        children: FormBuilder(
            key: _formKey,
            onChanged: () {
              _formKey.currentState!.save();
              debugPrint(_formKey.currentState!.value.toString());
            },
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(
                        _.avatarUrl ?? "",
                      ),
                    ),
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(height: 10),
                  TextFieldCopy(
                    controller: _.emailController,
                    name: "email",
                    label: 'Email',
                  ),
                  const SizedBox(height: 10),
                  TextFieldCopy(
                    initialValue: _.name,
                    name: "name",
                    label: 'Name',
                    disabled: true,
                  ),
                  const SizedBox(height: 10),
                  TextFieldCopy(
                    controller: _.studentCodeController,
                    label: "Student Code",
                    name: "studentCode",
                  ),
                  const SizedBox(height: 10),
                  TextFieldCopy(
                    controller: _.phoneController,
                    label: "Phone",
                    name: "phone",
                  ),
                  const SizedBox(height: 10),
                  RadioField<Gender>(
                    onChanged: _.onGenderChange,
                    label: "Gender",
                    name: "gender",
                    options: const [
                      FormBuilderFieldOption(
                        value: Gender.MALE,
                        child: Text('Male'),
                      ),
                      FormBuilderFieldOption(
                        value: Gender.FEMALE,
                        child: Text('Female'),
                      ),
                      FormBuilderFieldOption(
                        value: Gender.OTHERS,
                        child: Text('Others'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  DateField(
                    controller: _.birthdayController,
                    labelText: "Birthday",
                    name: "birthday",
                    initialValue: _.birthday == null
                        ? null
                        : DateUtil.fromString(_.birthday as String),
                  ),
                  const SizedBox(height: 30),
                  // bottom control button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: _.onClear,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).errorColor,
                          padding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 30,
                          ),
                        ),
                        child: const Text("Clear"),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: _.onSubmit,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 30,
                          ),
                        ),
                        child: const Text("Save"),
                      ),
                    ],
                  )
                ])
              ],
            )),
      ),
    );
  }
}
