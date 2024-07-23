import 'package:asasiyat/constants/style.dart';
import 'package:asasiyat/controllers/asas_controller.dart';
import 'package:asasiyat/widgets/asasiyat-drawer.dart';
import 'package:asasiyat/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AsasViewer extends StatelessWidget {
  AsasViewer({super.key});
  AsasController c = Get.find(tag: 'asasInstance');
  List<int> _catOrder = [];
  @override
  Widget build(BuildContext context) {
    debugPrint(_catOrder.toString());
    return Scaffold(
      drawer: asasdrawer(context: context),
      backgroundColor: Colors.white.withOpacity(.2),
      body: Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("dropdown cat "),
                Text("dropdown soura "),
                Text("${c.souraAsasList.length} souras  "),
                Switch(
                    value: c.asasTest,
                    onChanged: (bool tst) {
                      c.asasTest = tst;
                    })
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: c.souraAsasList.length,
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
