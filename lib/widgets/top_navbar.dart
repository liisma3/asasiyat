import 'package:asasiyat/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey key) {
  return AppBar(
    leading: Builder(builder: (context) {
      return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu));
    }),
    centerTitle: true,
    title: Text('asasiat by toutafait'.toUpperCase()),
    backgroundColor: AsasStyle.lightGreyColor,
    actions: [
      IconButton(
        icon:
            Get.isDarkMode ? Icon(Icons.sunny) : Icon(Icons.brightness_3_sharp),
        iconSize: 30,
        color: AsasStyle.asasColor,
        tooltip: 'Settings',
        onPressed: () {
          Get.changeTheme(
              Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
        },
      )
    ],
    elevation: 0,
  );
}
