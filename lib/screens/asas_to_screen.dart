import 'package:asasiyat/constants/data_helper.dart';
import 'package:asasiyat/models/widget_model.dart';
import 'package:asasiyat/widgets/asasiyat_navbar.dart';
import 'package:asasiyat/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class AsasToScreen extends StatelessWidget {
  AsasToScreen({super.key});
  static String prem = DataHelper.CategoryLabel.keys.toList()[0];
  static String deux = DataHelper.CategoryLabel.keys.toList()[1];
  static String third = DataHelper.CategoryLabel.keys.toList()[2];
  static String fourth = DataHelper.CategoryLabel.keys.toList()[3];
  static List<Category> mescat = [
    Category(title: prem, souraNameNb: DataHelper.CategoryLabel[prem]!),
    Category(title: deux, souraNameNb: DataHelper.CategoryLabel[deux]!),
    Category(title: third, souraNameNb: DataHelper.CategoryLabel[third]!),
    Category(title: fourth, souraNameNb: DataHelper.CategoryLabel[fourth]!),
  ];

  final GlobalKey<ScaffoldState> AsastoKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AsasiyatNavBar(
            context: context,
            key: AsastoKey,
            nextRoute: 'stages',
            title: 'asasto'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 16 / 9,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    padding: EdgeInsets.all(10),
                    children: [
                      ...mescat.map(
                        (cat) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(cat.title),
                                Expanded(
                                    child: ListView(
                                  children: [
                                    ...cat.souraNameNb.map(
                                      (catSoura) => Text(
                                        "${catSoura["souraName"]} ",
                                      ),
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
              BottomNavigation(),
            ],
          ),
        )
        //AlAsasPagesViewer()
        );
    //AsastoMultiViewer
  }
}
