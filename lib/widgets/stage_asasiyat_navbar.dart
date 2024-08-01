import 'package:asasiyat/constants/style.dart';
import 'package:asasiyat/controllers/stage_controller.dart';
import 'package:asasiyat/widgets/app_style.dart';
import 'package:asasiyat/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StageAsasiyatNavbar extends StatefulWidget {
  final grid;
  const StageAsasiyatNavbar({super.key, this.grid});

  @override
  State<StageAsasiyatNavbar> createState() => _StageAsasiyatNavbarState();
}

class _StageAsasiyatNavbarState extends State<StageAsasiyatNavbar> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StageController());
    final isGuest = widget.grid > 10 ? true : false;
    save() {
      print(widget.grid);
      print(controller.guestRegistred);
      Get.offAndToNamed('/home');
    }

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
            isGuest
                ? CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('/flags/ad.png'),
                  )
                : ElevatedButton.icon(
                    label: Icon(Icons.star_border_outlined),
                    onPressed: () => {
                      save(),
                    },
                  ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      text: isGuest && controller.guestRegistred != 0
                          ? "guest ${controller.guestRegistred} test stage ${widget.grid}"
                          : "stage  asaiyat ${widget.grid}",
                      style:
                          appStyle(20, Colors.yellowAccent, FontWeight.w600)),
                  ReusableText(
                      text: "host 0 Free guest",
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
                  child: controller.testSelected ? Text("RVW") : Text("TST"),
                  onPressed: () => {
                    print("${controller.testSelected}"),
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
