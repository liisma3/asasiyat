import 'package:asasiyat/constants/style.dart';
import 'package:asasiyat/controllers/stage_controller.dart';
import 'package:asasiyat/widgets/app_style.dart';
import 'package:asasiyat/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StagNavbar extends StatelessWidget {
  const StagNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StageController());

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 150,
      color: AsasStyle.asasColor,
      child: Container(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('/flags/ad.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      text: "guest 112",
                      style:
                          appStyle(20, Colors.yellowAccent, FontWeight.w600)),
                  ReusableText(
                      text: "host 0",
                      style:
                          appStyle(30, Colors.brown.shade800, FontWeight.w200)),
                ],
              ),
            ),
            Text(
              getTime(),
              style: TextStyle(fontSize: 40),
            ),
            (Obx(() => ElevatedButton(
                  child: controller.testSelected ? Text("TST") : Text("RVW"),
                  onPressed: () => {
                    controller.setTestSelected = !controller.testSelected,
                  },
                ))),
          ],
        ),
      ),
    );
  }
}

String getTime() {
  DateTime today = DateTime.now();
  int hour = today.hour;
  if (hour >= 0 && hour < 12) {
    return '🧑🏿‍🎓';
  } else if (hour >= 12 && hour < 16) {
    return '📔';
  } else {
    return '🌸';
  }
}
