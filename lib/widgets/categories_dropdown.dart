// ignore_for_file: unnecessary_import

import 'package:asasiyat/constants/data_helper.dart';
import 'package:asasiyat/controllers/stage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoriesDropdown extends StatefulWidget {
  // AsasController c = Get.find(tag: 'asasInstance');
  CategoriesDropdown({
    super.key,
  });

  @override
  State<CategoriesDropdown> createState() => _CategoriesDropdownState();
}

class _CategoriesDropdownState extends State<CategoriesDropdown> {
  GlobalKey catDropdownKey = GlobalKey();

/*   static List<Map<String, dynamic>> _souraAsasList =
      DataHelper.CategoryLabel[cat]!.toList();
  @override
 */
  Widget build(BuildContext context) {
    final controller = Get.put(StageController());
    List<String> categories = DataHelper.CategoryLabel.keys.toList();
    final String cat = categories.first;
    String categorySelected = cat;
    return Container(
      height: 20,
      child: Obx(() => DropdownButton<String>(
          underline: Container(),
          hint: Text("Select category"),
          icon: const Icon(Icons.keyboard_arrow_down),
          isDense: true,
          isExpanded: true,
          items: [
            ...categories.map(
              (cat) => DropdownMenuItem<String>(
                value: cat,
                child: Text(cat),
              ),
            )
          ],
          value: controller.categorySelected,
          onChanged: (value) {
            controller.setCategorySelected = value!;
            setState(() {
              categorySelected = value;
            });
          })),
    );

    //Padding
  }
}
