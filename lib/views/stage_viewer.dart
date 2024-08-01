import 'dart:convert';

import 'package:asasiyat/controllers/stage_controller.dart';
import 'package:asasiyat/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class StageViewer extends StatelessWidget {
  var souraNb;
  StageViewer({super.key, required int souraNb});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StageController());
    Future<void> readJson() async {
      final String response =
          await rootBundle.loadString("shares/grids/${this.souraNb}.json");
      final data = await json.decode(response);
      print(data.toString());
    }

    var gridNb = controller.gridNb;
    print(gridNb);
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          /*   Expanded(
              child: ListView.builder(
                  itemCount: controller..length,
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
                          {_catOrder.add(c.souraAsasList[index]["souraNb"])}
                      },
                      child: ListTile(
                        onTap: () {
                          debugPrint(c.souraAsasList[index]["souraName"]);
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
                                  "index : $index      ${c.souraAsasList[index]["souraName"]}"),
                              Text("${c.souraAsasList[index]["souraNb"]}"),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

              //children
            ) ,*/
          BottomNavigation(),
        ],
      ),
    );
  }
}
/**
 * 

 */
