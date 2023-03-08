import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/change_theme_color.controller.dart';
import 'package:pss_m/core/constants/theme.dart';

class ChangeThemeColorScreen extends StatelessWidget {
  const ChangeThemeColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Theme Color"),
      ),
      body: GetBuilder<ChangeThemeColorController>(
        init: ChangeThemeColorController(),
        builder: (_) => ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _.colorList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _.themeController.changeColor(_.colorList[index]);
              },
              child: Obx(() => Container(
                    width: 40,
                    height: 50,
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: _.colorList[index],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: _.themeController.color == _.colorList[index]
                            ? Colors.black
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}
