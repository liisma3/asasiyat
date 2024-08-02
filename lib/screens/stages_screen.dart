//import 'package:asas/stage-module/stages_viewer.dart';
import 'dart:convert';

import 'package:asasiyat/constants/data_helper.dart';
import 'package:asasiyat/controllers/stage_controller.dart';
import 'package:asasiyat/widgets/asasiyat-drawer.dart';
import 'package:asasiyat/widgets/stage_asasiyat_navbar.dart';
import 'package:asasiyat/widgets/stage_bottom_navigation.dart';
import 'package:asasiyat/widgets/stage_drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StagesScreen extends StatefulWidget {
  StagesScreen({super.key});

  //List<Widget> souarWidget = DataHelper.CategoryLabel["${controller.stageCategorySelected}"]!.toList().map((e) => Text("${e["souraName"]}")).toList();
  @override
  State<StagesScreen> createState() => _StagesScreenState();
}

class _StagesScreenState extends State<StagesScreen> {
  final GlobalKey scaffoldKey = GlobalKey();
  final int gridNb = int.parse(Get.parameters['grid']!);

  /* List<Map<String, dynamic>> souarNames = DataHelper
  
      .CategoryLabel["${DataHelper.CategoryLabel.keys.toList()[0]}"]!
      .toList();
 */
  List<int> sortGridTest = [0];
  late Set souarShuffeled = Set();
  late Set souarNamesSet = Set();
  Future getSouarShuffeled(String cat) async {
    final souars = DataHelper.CategoryLabel[cat]!.toList();
    souarNamesSet.addAll(souars);

    // print("souarNamesSet $souarNamesSet");
    setState(() {
      souarShuffeled.addAll(DataHelper.shuffleArray(souars).toList());
    });
  }

  static final storage = GetStorage('asasStorage');
  final guestToken = storage.read("guestToken ");
  final hostToken = storage.read("hostToken");
  final phoneNb = storage.read("phoneNb");
  @override
  void initState() {
    /* final List souarNames =
        List.filled(DataHelper.(DataHelper.CategoryLabel.keys.toList()[0]), 0); */
    /*  print(
        "category selected ${controller.stageCategorySelected ?? controller.stageCategorySelected} /// souar names:${intSouarNames ?? intSouarNames}");
 */
    //print(controller.hostRegistred);
    /*  if (controller.guestRegistred != 0) {

    } else {
      Future.delayed(
        Duration(seconds: 1),
        () => Get.offAndToNamed('/login'),
      ); */
    // TODO: implement initState
    super.initState();
  }

  static final StageController controller = Get.put(StageController());

  final souarNames =
      DataHelper.CategoryLabel[controller.categorySelected]!.toList();
  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    print(controller.souraNameSelected);
    print(controller.categorySelected);
    print(controller.souraNb.toString());

    //controller.setGridNb = gridNb;

    return Scaffold(
        drawer: asasdrawer(context: context),
        appBar: PreferredSize(
          child: StageAsasiyatNavbar(grid: gridNb),
          preferredSize: Size.fromHeight(110),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: StageDropDownWidget()
                  /*  StageCategoriesList(
                      getSouarShuffeled: getSouarShuffeled) */
                  ),
              (Obx(
                () => Expanded(
                    flex: 9,
                    child: Container(
                      height: double.infinity,
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 2)),
                      child: controller.stageCategorySelected != ''
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  Text(controller.categorySelected),
                                  Text(controller.souraNameSelected),

                                  /*    Expanded(
                                    child: ReorderableListView(
                                        onReorder: (oldIndex, newIndex) {
                                          print(
                                              "oldIndex ${oldIndex} ||| newIndex : $newIndex");
                                          if (newIndex > oldIndex) {
                                            newIndex -= 1;
                                          }
                                          final items = '';
                                        },
                                        scrollDirection: Axis.vertical,
                                        children: souarShuffeled.isEmpty &&
                                                !controller.testSelected
                                            ? [
                                                ...DataHelper.CategoryLabel[
                                                        "${controller.stageCategorySelected}"]!
                                                    .toList()
                                                    .map(
                                                      (e) => ListTile(
                                                        key: UniqueKey(),
                                                        leading: Container(
                                                          height: 30,
                                                          width: 30,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .blueAccent,
                                                              shape: BoxShape
                                                                  .circle),
                                                          child: Text(
                                                              "${e["souraNb"]}",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white38)),
                                                        ),
                                                        title: Text(
                                                          "${e["souraName"]}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color: Color((Random()
                                                                              .nextDouble() *
                                                                          0xFFFFFF)
                                                                      .toInt())
                                                                  .withOpacity(
                                                                      1.0)),
                                                        ),
                                                        trailing: Container(
                                                          child: ElevatedButton(
                                                            onPressed: () => {
                                                              if (controller
                                                                  .testSelected)
                                                                {
                                                                  Get.toNamed(
                                                                      "/stage/${e["souraNb"]}"),
                                                                }
                                                              else
                                                                {
                                                                  print(controller
                                                                      .sortSouraNb),
                                                                  if (sortGridTest[
                                                                          0] ==
                                                                      0)
                                                                    {
                                                                      sortGridTest =
                                                                          [
                                                                        e["souraNb"]
                                                                      ],
                                                                    }
                                                                  else
                                                                    {
                                                                      sortGridTest =
                                                                          [
                                                                        ...sortGridTest,
                                                                        e["souraNb"]
                                                                      ]
                                                                    },
                                                                  controller
                                                                          .addToSortSouraNb =
                                                                      e["souraNb"],
                                                                  setState(
                                                                      () {})
                                                                }
                                                            },
                                                            child: Icon(
                                                                Icons.reorder),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                              ]
                                            : [
                                                ...souarShuffeled.map(
                                                  (e) => ListTile(
                                                    key: UniqueKey(),
                                                    leading: Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.blueAccent,
                                                          shape:
                                                              BoxShape.circle),
                                                      child: Text(
                                                          '${controller.testSelected ? '_' : e["souraNb"]}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ),
                                                    title: Text(
                                                      "${e["souraName"]}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Color((Random()
                                                                          .nextDouble() *
                                                                      0xFFFFFF)
                                                                  .toInt())
                                                              .withOpacity(
                                                                  1.0)),
                                                    ),
                                                    trailing: Container(
                                                      child: ElevatedButton(
                                                        onPressed: () => {
                                                          if (controller
                                                              .testSelected)
                                                            {
                                                              Get.toNamed(
                                                                  "/stage/${e["souraNb"]}"),
                                                            }
                                                          else
                                                            {
                                                              print(controller
                                                                  .sortSouraNb),
                                                              if (sortGridTest[
                                                                      0] ==
                                                                  0)
                                                                {
                                                                  sortGridTest =
                                                                      [
                                                                    e["souraNb"]
                                                                  ],
                                                                }
                                                              else
                                                                {
                                                                  sortGridTest =
                                                                      [
                                                                    ...sortGridTest,
                                                                    e["souraNb"]
                                                                  ]
                                                                },
                                                              controller
                                                                      .addToSortSouraNb =
                                                                  e["souraNb"],
                                                              setState(() {})
                                                            }
                                                        },
                                                        child:
                                                            Icon(Icons.reorder),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ]),
                                  )
                               */
                                ])
                          : Text(" please select a category"),
                    )),
              )),
              StageBottomNavigation(scaffoldKey)
            ],
          ),
        ));
  }
}
