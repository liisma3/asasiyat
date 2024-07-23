import 'package:asasiyat/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar StageNavBar(
    BuildContext context, GlobalKey key, int grid, Function validate) {
  return AppBar(
    leading: Builder(builder: (context) {
      return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.grade_outlined));
    }),
    centerTitle: true,
    title: Text('stage $grid'.toUpperCase()),
    backgroundColor: AsasStyle.asasColor,
    actions: [
      IconButton(
          icon: Get.isDarkMode
              ? Icon(Icons.sunny)
              : Icon(Icons.brightness_3_sharp),
          iconSize: 30,
          color: AsasStyle.lightGreyColor,
          tooltip: Get.isDarkMode ? "light" : "dark",
          onPressed: () {
            Get.changeTheme(
                Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
          })
    ],
    elevation: 0,
  );
}
