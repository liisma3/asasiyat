import 'package:asasiyat/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StageBottomNavigation extends StatelessWidget {
  const StageBottomNavigation(GlobalKey<State<StatefulWidget>> scaffoldKey,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //padding: EdgeInsets.all(3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            onPressed: () {
              Get.toNamed('/stages/3');
            },
            icon: Icon(Icons.filter_3_outlined),
            label: Text("Stage 3"),
            style: ButtonStyle(
                foregroundColor:
                    WidgetStatePropertyAll<Color>(AsasStyle.asasDarkText)),
          ),
          TextButton.icon(
              onPressed: () {
                Get.toNamed('/stages/4');
              },
              icon: Icon(Icons.filter_4_outlined),
              label: Text("Stage 4")),
          TextButton.icon(
              onPressed: () {
                Get.toNamed('/stages/5');
              },
              icon: Icon(Icons.filter_5_outlined),
              label: Text("Stage 5")),
          TextButton.icon(
              onPressed: () {
                Get.toNamed('/toutafait');
              },
              icon: Icon(Icons.grading_outlined),
              label: Text("Tout A Fait")),
        ],
      ),
    );
  }
}
