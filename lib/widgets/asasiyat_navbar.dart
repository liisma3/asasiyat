import 'package:asasiyat/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


AppBar AsasiatNavBar(
    {required BuildContext context,
    required GlobalKey<ScaffoldState> key,
    required String title,
    required String nextRoute}) {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          key.currentState?.openDrawer();
        },
        icon: Icon(Icons.menu)),
    title: Text("$title".toUpperCase()),
    backgroundColor: AsasStyle.lightColor,
    actions: [
      IconButton(
          onPressed: () {
            Get.toNamed('/home');
          },
          icon: const Icon(Icons.arrow_back_outlined)),
      IconButton(
          onPressed: () {
            Get.toNamed('/$nextRoute');
          },
          icon: const Icon(Icons.arrow_forward_outlined)),
    ],
    elevation: 10,
  );
}
