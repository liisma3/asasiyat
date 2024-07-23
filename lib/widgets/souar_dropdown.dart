// ignore_for_file: unnecessary_import

import 'package:asasiyat/controllers/asas_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SouarDropdown extends StatelessWidget {
  final souar;
  // AsasController c = Get.find(tag: 'asasInstance');
  SouarDropdown({super.key, required this.souar});

  GlobalKey souarDropdownKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AsasController());

    var souraNameSelected;
    print(souar);

    try {
      return Obx(() => Container(
            height: 20,
            child: DropdownButton<String>(
                underline: Container(),
                hint: Text("Select category"),
                icon: const Icon(Icons.keyboard_arrow_down),
                isDense: true,
                isExpanded: true,
                items: [
                  ...this.souar.map(
                        (souraName) => DropdownMenuItem<String>(
                          value: souraName["souraNb"],
                          child: Text(souraName["souraName"]),
                        ),
                      )
                ],
                value: controller.souraNameSelected,
                onChanged: (value) {
                  controller.setSouraNameSelected = value!;
                  souraNameSelected = value;
                  // print(await this.ca);

                  //  c.category[value];
                }),
          ));

      //Padding
    } catch (e) {
      debugPrint("e");
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20), child: Text("$e"));
    }
  }
}
