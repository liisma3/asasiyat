// ignore_for_file: unnecessary_import

import 'package:asasiyat/constants/data_helper.dart';
import 'package:asasiyat/controllers/stage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SouarDropdown extends StatefulWidget {
  // AsasController c = Get.find(tag: 'asasInstance');
  SouarDropdown({super.key});

  @override
  State<SouarDropdown> createState() => _SouarDropdownState();
}

class _SouarDropdownState extends State<SouarDropdown> {
  GlobalKey souarDropdownKey = GlobalKey();
  static final controller = Get.put(StageController());

  String souraNameSelected = '';
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>>? souarNames =
        DataHelper.CategoryLabel[controller.categorySelected]!.toList();

    var names = souarNames!
        .map(
          (e) => e["souraName"],
        )
        .toList();
    //List _souraNames = jsonEncode(souarNames);
//    print(names);

    // print(controller.categorySelected);
    //if (controller.souraNameSelected != "") {
    // print(controller.souraNameSelected);

    //}

    return Obx(
      () => Container(
        height: 20,
        child: DropdownButton<String>(
            hint: Text("Select soura"),
            icon: const Icon(Icons.keyboard_arrow_down),
            isDense: true,
            // isExpanded: true,
            items: names.map((souraName) {
              //print(souraName);
              return DropdownMenuItem<String>(
                value: souraName.toString(),
                child: Text(souraName.toString()),
              );
            }).toList(),
            value: controller.souraNameSelected != souraNameSelected
                ? controller.souraNameSelected
                : souraNameSelected != ''
                    ? souraNameSelected
                    : names[0],
            onChanged: (value) {
              controller.setSouraNameSelected = value!;
              souraNameSelected = value;
              setState(() {});
            }),
      ),
    );
  }

  //Padding
}
