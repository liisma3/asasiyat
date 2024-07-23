import 'package:asasiyat/widgets/asasiyat-drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unnecessary_import
import 'package:get/get_core/src/get_main.dart';

class AsastLayout extends StatelessWidget {
  AsastLayout({super.key});
  // AsasController c = Get.find(tag: 'asasInstance');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('asas by toutafait'.toUpperCase()),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            iconSize: 30,
            color: Colors.green.shade700,
            tooltip: 'Settings',
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              //snackbar('ALLAH AKBAR', "wa liLLAHI alhamd");
            },
          )
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text('DropDown cat')),
              Expanded(child: Text('DropDown cat'))
            ],
          ),
          Container(
            child: Center(child: Text("Asas app from tout a fait")),
          ),
        ],
      ),
      drawer: asasdrawer(context: context),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green.shade300,
        selectedLabelStyle: TextStyle(color: Colors.cyan.shade900),
        unselectedItemColor: Colors.blueGrey,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.now_widgets_outlined), label: 'Asas'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.build_outlined), label: 'Al Asas'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.snowboarding_outlined), label: 'Asasto'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.location_city_outlined), label: 'Asasna'),
        ],
        currentIndex: 0,
        onTap: (value) => {
          if (value == 0)
            {
              Get.toNamed('/asas'),
            },
          if (value == 1)
            {
              Get.toNamed('/alasas'),
            },
          if (value == 2) {},
          if (value == 3)
            {
              Get.toNamed('/asasna'),
            }
          //currentIndex = value;
        },
      ),
    );
  }
}
