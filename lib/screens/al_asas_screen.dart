import 'package:asasiyat/constants/data_helper.dart';
import 'package:asasiyat/controllers/asas_controller.dart';
import 'package:asasiyat/models/widget_model.dart';
import 'package:asasiyat/widgets/asasiyat-drawer.dart';
import 'package:asasiyat/widgets/asasiyat_navbar.dart';
import 'package:asasiyat/widgets/bottom_navigation.dart';
import 'package:asasiyat/widgets/categories_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlAsasScreen extends StatelessWidget {
  AlAsasScreen({super.key});
  //final Widget alAsasContent;
  final GlobalKey<ScaffoldState> alAsasKey = GlobalKey();
  final catEntries = DataHelper.CategoryLabel.entries;
  final List<Category> categories = DataHelper.CategoryLabel.entries
      .map((mapEntry) =>
          Category(title: mapEntry.key, souraNameNb: mapEntry.value))
      .toList();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AsasController());
    final souarNames = (String cat) =>
        catEntries.map((e) => {if (e.key == cat) e.value}).toList();
    if (souarNames("TIWAL") is List) {
      // print(souarNames);

      // souarNames("TIWAL").forEach((souraName) => print(souraName["souraNb"]));
    }
    return Scaffold(
        key: alAsasKey,
        drawer: asasdrawer(context: context),
        appBar: AsasiatNavBar(
            context: context,
            key: alAsasKey,
            nextRoute: 'asasto',
            title: 'alasas'),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              heightFactor: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: CategoriesDropdown(categories: categories),
                    ),
                  ),
                  /*   Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: SouarDropdown(
                        souar: souarNames,
                      ),
                    ),
                  ), */
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(20)),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: SingleChildScrollView(child: Text("al asas")),
                ),
              ),
            ),
            Align(alignment: Alignment.bottomCenter, child: BottomNavigation()),
          ],
        )
        //AlAsasPagesViewer()
        );
    //AsastoMultiViewer
  }
}
