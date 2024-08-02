import 'package:asasiyat/constants/data_helper.dart';
import 'package:asasiyat/constants/style.dart';
import 'package:asasiyat/controllers/stage_controller.dart';
import 'package:asasiyat/widgets/asasiyat-drawer.dart';
import 'package:asasiyat/widgets/bottom_navigation.dart';
import 'package:asasiyat/widgets/stage_drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable

class AsasViewer extends StatefulWidget {
  AsasViewer({super.key});

  @override
  State<AsasViewer> createState() => _AsasViewerState();
}

class _AsasViewerState extends State<AsasViewer> {
  List<int> _catOrder = [];
  // static List<String> categories = DataHelper.CategoryLabel.keys.toList();
  //static String cat = categories.first;

  @override
  Widget build(BuildContext context) {
    StageController controller = Get.put(StageController());

    //  print("categories : ${controller.testSelected}");
    /*  List<Map<String, dynamic>> souraAsasList =
        DataHelper.CategoryLabel["${controller.categorySelected}"]!.toList();
    */ // print("asasViewer ${souraAsasList}");
    //  print("asasViewer ${controller.categorySelected}");
    bool testSelected =
        controller.testSelected ? controller.testSelected : false;

    /*

 */
    //Map<String, List<Map<String, dynamic>>>
    // var keys = DataHelper.CategoryLabel.keys.toList();
    // var catNames = DataHelper.CategoryLabel[keys[1]]!.toList();
    //var souar = catNames.map(
    //  (e) => e.entries,
    //);
    //List<Map<String, dynamic>> _catNames = Map.from(catNames);
    // print(" keys : $keys, souar : $souar");
    //debugPrint(_catOrder.toString());

    return Scaffold(
      drawer: asasdrawer(context: context),
      backgroundColor: Colors.white.withOpacity(.2),
      body: Obx(
        () => Column(
          children: [
            StageDropDownWidget(),
            Expanded(
              flex: 9,

              child: ListView.builder(
                  itemCount: DataHelper
                      .CategoryLabel["${controller.categorySelected}"]!
                      .toList()
                      .length,
                  itemBuilder: (BuildContext context, int index) {
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
                      onDismissed: (direction) => {},
                      child: ListTile(
                        onTap: () {
                          //  if (direction == DismissDirection.startToEnd)
                          {
                            _catOrder.add(DataHelper.CategoryLabel[
                                    "${controller.categorySelected}"]!
                                .toList()[index]["souraNb"]);
                          }
                          debugPrint(DataHelper
                              .CategoryLabel["${controller.categorySelected}"]!
                              .toList()[index]["souraName"]);
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
                                  "index : $index      ${DataHelper.CategoryLabel["${controller.categorySelected}"]!.toList()[index]["souraName"]}"),
                              !testSelected
                                  ? Text(
                                      "${DataHelper.CategoryLabel["${controller.categorySelected}"]!.toList()[index]["souraNb"]}")
                                  : Text("___"),
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
