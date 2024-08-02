import 'package:asasiyat/constants/data_helper.dart';
import 'package:asasiyat/controllers/stage_controller.dart';
import 'package:asasiyat/widgets/categories_dropdown.dart';
import 'package:asasiyat/widgets/souar_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StageDropDownWidget extends StatefulWidget {
  const StageDropDownWidget({super.key});

  @override
  State<StageDropDownWidget> createState() => _StageDropDownWidgetState();
}

class _StageDropDownWidgetState extends State<StageDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    StageController controller = Get.put(StageController());

    //print("categories : ${controller.testSelected}");
    /*  List<Map<String, dynamic>> souraAsasList =
        DataHelper.CategoryLabel["${controller.categorySelected}"]!.toList();
    */ // print("asasViewer ${souraAsasList}");
    //  print("asasViewer ${controller.categorySelected}");
    bool testSelected =
        controller.testSelected ? controller.testSelected : false;

    return Expanded(
        child: Container(
      child: (Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: CategoriesDropdown()),
            Expanded(
              child: SouarDropdown(),
            ),

            Text(
                "Number of souar ${DataHelper.CategoryLabel["${controller.categorySelected}"]!.toList().length} "),
            //              Text("${controller.souraAsasList.length} souras  "),
            ElevatedButton.icon(
                label: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(20)),
                  child: controller.testSelected
                      ? Text('test',
                          style: TextStyle(
                            color: Colors.green.shade300,
                          ))
                      : Text(
                          'review',
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            backgroundColor: Colors.green.shade300,
                          ),
                        ),
                ),
                onPressed: () {
                  controller.setTestSelected = !controller.testSelected;
                  setState(() {
                    testSelected = !testSelected;
                  });
                }),
          ],
        ),
      )),
    ));
  }
}
