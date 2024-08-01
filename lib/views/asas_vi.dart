import 'package:asasiyat/controllers/asas_controller.dart';
import 'package:asasiyat/widgets/categories_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AsasViewer extends StatelessWidget {
  AsasViewer({super.key});
  AsasController c = Get.find(tag: 'asasInstance');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(tabs: [
          Icon(
            Icons.topic,
            size: 25,
          ),
          Icon(Icons.shuffle, size: 25),
          // CategoriesDropdown(),
        ]),
      ),
      body: Obx(
        () => Column(
          children: [
            Center(
                child: Container(
              height: 35,
              child: CategoriesDropdown(),
              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
            )),
            Expanded(
                flex: 1,
                child: Center(
                    child: TabBarView(
                  children: [
                    ListView.builder(
                        itemCount: c.souraAsasList.length,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: ListTile(
                                  title: GestureDetector(
                                      onTap: () {
                                        debugPrint(c.souraAsasList[index]
                                            ["souraName"]);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              "${c.souraAsasList[index]["souraName"]}"),
                                          Text(
                                              "${c.souraAsasList[index]["souraNb"]}"),
                                        ],
                                      ))));
                        }),
                    ListView.builder(
                        itemCount: c.souraAsasList.length,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: ListTile(
                                  title: GestureDetector(
                                      onTap: () {
                                        bool equal =
                                            c.souraShuffeledAsasList[index]
                                                    ["souraNb"] ==
                                                c.souraAsasList[0]["souraNb"];
                                        if (equal) {
                                          debugPrint(
                                              "minimum : ${c.souraShuffeledAsasList[index]["souraName"]}");
                                        }
                                        debugPrint(
                                            c.souraShuffeledAsasList[index - 1]
                                                ["souraName"]);
                                      },
                                      child: Text(
                                        "${c.souraShuffeledAsasList[index]["souraName"]}",
                                        style: TextStyle(
                                            backgroundColor:
                                                c.souraShuffeledAsasList[index]
                                                            ["souraNb"] ==
                                                        c.souraShuffeledAsasList[
                                                            0]["souraNb"]
                                                    ? Colors.green.shade300
                                                    : Colors.white24),
                                      ))));
                        })
                  ], //children
                ))),
          ],
        ),
      ),
    );
  }
}
