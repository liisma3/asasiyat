import 'package:asasiyat/constants/data_helper.dart';
import 'package:asasiyat/constants/style.dart';
import 'package:asasiyat/controllers/stage_controller.dart';
import 'package:asasiyat/widgets/asasiyat-drawer.dart';
import 'package:asasiyat/widgets/bottom_navigation.dart';
import 'package:asasiyat/widgets/categories_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable

class AsasViewer extends StatefulWidget {
  AsasViewer({super.key});

  @override
  State<AsasViewer> createState() => _AsasViewerState();
}

class _AsasViewerState extends State<AsasViewer> {
  static final controller = Get.put(StageController());
  List<int> _catOrder = [];
  // static List<String> categories = DataHelper.CategoryLabel.keys.toList();
  //static String cat = categories.first;
  static List<Map<String, dynamic>> souraAsasList =
      DataHelper.CategoryLabel["${controller.categorySelected}"]!.toList();

  @override
  Widget build(BuildContext context) {
    print("categories : ${controller.categorySelected}");
    print(
        "dataH : ${DataHelper.CategoryLabel["${controller.categorySelected}"]![0].toString()}");
    //debugPrint(_catOrder.toString());

    return Scaffold(
      drawer: asasdrawer(context: context),
      backgroundColor: Colors.white.withOpacity(.2),
      body: Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: CategoriesDropdown()),
                //SouarDropdown(),

                Text("catSelected ${controller.categorySelected} "),
                //              Text("${controller.souraAsasList.length} souras  "),
                Switch(
                    value: controller.asasTest,
                    onChanged: (bool tst) {
                      controller.asasTest = tst;
                    })
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: souraAsasList.length,
                  itemBuilder: (BuildContext contect, int index) {
                    return Dismissible(
                      direction: DismissDirection.startToEnd,
                      key: UniqueKey(),
                      background: Container(
                        color: AsasStyle.asasColor,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.check),
                            ),
                          ],
                        ),
                      ),
                      onDismissed: (direction) => {
                        if (direction == DismissDirection.startToEnd)
                          {_catOrder.add(souraAsasList[index]["souraNb"])}
                      },
                      child: ListTile(
                        onTap: () {
                          debugPrint(souraAsasList[index]["souraName"]);
                        },
                        trailing: Icon(
                          Icons.check_box_outlined,
                          color: AsasStyle.asasDarkText,
                        ),
                        title: InkWell(
                          highlightColor: AsasStyle.asasDarkText,
                          splashColor: AsasStyle.asasDarkText,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "index : $index      ${souraAsasList[index]["souraName"]}"),
                              Text("${souraAsasList[index]["souraNb"]}"),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

              //children
            ),
            BottomNavigation(),
          ],
        ),
      ),
    );
  }
}
/**
 * 

 */
