import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/profile.controller.dart';
import 'package:pss_m/core/constants/enum.dart';
import 'package:pss_m/core/form/radio.dart';
import 'package:pss_m/core/form/text_field.dart';
import 'package:pss_m/core/form/text_only.dart';
import 'package:pss_m/core/providers/user.provider.dart';
import 'package:pss_m/interface/form/radio/radio_data.dart';
import 'package:pss_m/widgets/layout/empty.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserProvider _userProvider = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => EmptyLayout(
        children: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                      controller.avatarUrl ?? "",
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    TextFieldC(
                      controller: controller.emailController,
                      label: "Email",
                      name: "email",
                    ),
                    const SizedBox(height: 10),
                    TextOnly(
                      label: "Name",
                      value: controller.name,
                    ),
                    const SizedBox(height: 10),
                    TextFieldC(
                      controller: controller.studentCodeController,
                      label: "Student Code",
                      name: "studentCode",
                    ),
                    const SizedBox(height: 10),
                    TextFieldC(
                      controller: controller.phoneController,
                      label: "Phone",
                      name: "phone",
                    ),
                    const SizedBox(height: 10),
                    RadioC<Gender>(
                      label: 'Gender',
                      options: [
                        IRadioData(label: "Male", value: Gender.MALE),
                        IRadioData(label: "Female", value: Gender.FEMALE),
                      ],
                      onInputChange: controller.onGenderChange,
                    ),
                    const SizedBox(height: 10),
                    TextFieldC(
                      controller: controller.birthdayController,
                      label: "Birthday",
                      name: "birthday",
                      keyBoardType: TextInputType.datetime,
                      context: context,
                    ),
                    const SizedBox(height: 30),
                    // bottom control button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: controller.onClear,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).errorColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 30),
                          ),
                          child: const Text("Clear"),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: controller.onSubmit,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 30),
                          ),
                          child: const Text("Save"),
                        ),
                      ],
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
