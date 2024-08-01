import 'package:asasiyat/controllers/asas_controller.dart';
import 'package:asasiyat/widgets/categories_dropdown.dart';
import 'package:asasiyat/widgets/souar_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// DropdownMenuEntry labels and values for the first dropdown menu.

// DropdownMenuEntry labels and values for the second dropdown menu.
class AsastoViewer extends StatelessWidget {
  AsastoViewer({super.key});
  AsasController c = Get.find(tag: 'asasInstance');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("asasto try to order grids"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.home_mini_outlined),
              tooltip: 'return to App',
              onPressed: () {
                Get.offAllNamed('/asas');
              },
            ),
          ],
        ),
        body: Obx(
          () => Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (c.categories.isEmpty)
                      const Center(child: CircularProgressIndicator())
                    else
                      Expanded(
                          child: Card(
                              color: Colors.green.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                // Provide a specific height constraint
                                padding: const EdgeInsets.all(15.0),

                                child: CategoriesDropdown(),
                              ) // Padding
                              ) //Card
                          ), //Expanded

                    Expanded(
                        child: Card(
                      color: Colors.greenAccent.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        child: SouarDropdown(), //Contaner
                      ),
                    )),
                  ],
                ),
              ),
              (c.souraSelectedNb != '-1' && c.category != "")
                  ? Text('You selected a ${c.souraSelectedNb} ${c.category}')
                  : Text('Please soura .')
            ],
          ),
        ) //Obx
        );
  }
}
