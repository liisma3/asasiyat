// ignore_for_file: unnecessary_import

import 'package:asasiyat/controllers/asas_controller.dart';
import 'package:asasiyat/models/widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoriesDropdown extends StatelessWidget {
  final List<Category> categories;

  // AsasController c = Get.find(tag: 'asasInstance');
  CategoriesDropdown({super.key, required this.categories});

  GlobalKey catDropdownKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AsasController());

    var catSelected;

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
                  ...this.categories.map(
                        (Category cat) => DropdownMenuItem<String>(
                          value: cat.title,
                          child: Text(cat.title),
                        ),
                      )
                ],
                value: controller.categorySelected,
                onChanged: (value) {
                  controller.setCategorySelected = value!;
                  catSelected = value!;
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
