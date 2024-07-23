// ignore_for_file: unnecessary_import

import 'package:asasiyat/constants/data_helper.dart';
import 'package:asasiyat/constants/style.dart';
import 'package:asasiyat/controllers/asas_controller.dart';
import 'package:asasiyat/controllers/stage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class StageCategoriesList extends StatelessWidget {
  AsasController c = Get.find(tag: 'asasInstance');
  StageCategoriesList({
    super.key,
  });

  GlobalKey catDropdownKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StageController());

    try {
      return Container(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              DataHelper.CategoryLabel.entries.length,
              (i) {
                var cat = DataHelper.CategoryLabel.entries.toList()[i];
                //print(cat);
                return GestureDetector(
                  onTap: () {
                    
                    if (controller.stageCategorySelected == cat.key) {
                      controller.setStageCategorySelected = '';
                    } else {
                      controller.setStageCategorySelected = cat.key as String;
                    }
                  },
                  child: (Obx(() => Container(
                        margin: EdgeInsets.only(right: 20),
                        padding: EdgeInsets.only(top: 5),
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: controller.stageCategorySelected == cat.key
                                  ? AsasStyle.activeColor
                                  : AsasStyle.inactiveColor,
                              width: controller.stageCategorySelected == cat
                                  ? 2
                                  : 1),
                        ),
                        child: Column(
                          children: [
                            Text(
                                "${DataHelper.CategoryLabel.entries.toList()[i].key}"),
                            SizedBox(
                              height: 50,
                              child: Text(
                                  "${DataHelper.CategoryLabel.entries.toList()[i].value.toList().length} souras"),
                            )
                          ],
                        ),
                      ))),
                );
              },
            ),
          ));

      //Padding
    } catch (e) {
      debugPrint("e");
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20), child: Text("$e"));
    }
  }
}
