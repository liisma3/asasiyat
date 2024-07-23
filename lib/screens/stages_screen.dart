//import 'package:asas/stage-module/stages_viewer.dart';
import 'dart:math';

import 'package:asasiyat/constants/data_helper.dart';
import 'package:asasiyat/controllers/stage_controller.dart';
import 'package:asasiyat/widgets/asasiyat-drawer.dart';
import 'package:asasiyat/widgets/stag_navbar.dart';
import 'package:asasiyat/widgets/stage_bottom_navigation.dart';
import 'package:asasiyat/widgets/stage_categories_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StagesScreen extends StatelessWidget {
  StagesScreen({super.key});
  final GlobalKey scaffoldKey = GlobalKey();
  final int gridNb = int.parse(Get.parameters['grid']!);
  void validate(String value) {
    print('$value');
  }

  @override
  Widget build(BuildContext context) {
    print(gridNb);
    final controller = Get.put(StageController());

    return Scaffold(
        drawer: asasdrawer(context: context),
        appBar: PreferredSize(
          child: StagNavbar(),
          preferredSize: Size.fromHeight(110),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StageCategoriesList(),
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
                                  Text(controller.stageCategorySelected),
                                  Expanded(
                                    child: ListView(
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          ...DataHelper.CategoryLabel[
                                                  "${controller!.stageCategorySelected}"]!
                                              .toList()
                                              .map(
                                                (e) => Text(
                                                  "${controller.testSelected ? e["souraNb"] : '_'} :  ${e["souraName"]}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Color((Random()
                                                                      .nextDouble() *
                                                                  0xFFFFFF)
                                                              .toInt())
                                                          .withOpacity(1.0)),
                                                ),
                                              )
                                        ]),
                                  )
                                ])
                          : Text(" select a category"),
                    )),
              )),
              StageBottomNavigation(scaffoldKey)
            ],
          ),
        ));
  }
}
