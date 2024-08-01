import 'package:asasiyat/constants/style.dart';
import 'package:asasiyat/controllers/stage_controller.dart';
import 'package:asasiyat/widgets/app_style.dart';
import 'package:asasiyat/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SouraNavbar extends StatefulWidget {
  int souraNb = 0;
  SouraNavbar({super.key, required int this.souraNb});

  @override
  State<SouraNavbar> createState() => _SouraNavbarState();
}

class _SouraNavbarState extends State<SouraNavbar> {
  get souraNb => null;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StageController());
    // final isGuest = this.grid > 10 ? true : false;
    var souraNb;
    initState() {
      souraNb = widget.souraNb;
    }

    print(controller.isGuest);
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
            controller.isGuest
                ? CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('/flags/ad.png'),
                  )
                : ElevatedButton.icon(
                    icon: Icon(Icons.star_border_outlined),
                    label: Text('return to stages'),
                    onPressed: () => {Get.toNamed("/stages/3")},
                  ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      text: controller.isGuest
                          ? "guest ${controller.guestRegistred} stage soura ${this.souraNb} "
                          : "stage soura ${widget.souraNb}",
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
