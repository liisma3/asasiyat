import 'package:asasiyat/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            onPressed: () {
              Get.toNamed('/home');
            },
            icon: Icon(Icons.home_max_outlined),
            label: Text("Home"),
            style: ButtonStyle(
                foregroundColor:
                    WidgetStatePropertyAll<Color>(AsasStyle.asasDarkText)),
          ),
          TextButton.icon(
              onPressed: () {
                Get.toNamed('/asas');
              },
              icon: Icon(Icons.now_widgets_outlined),
              label: Text("Asas")),
          TextButton.icon(
              onPressed: () {
                Get.toNamed('/alasas');
              },
              icon: Icon(Icons.build_outlined),
              label: Text("Al Asas")),
          TextButton.icon(
              onPressed: () {
                Get.toNamed('/asasto');
              },
              icon: Icon(Icons.snowboarding_outlined),
              label: Text("Asasto")),
          TextButton.icon(
              onPressed: () {
                Get.toNamed('/asasna');
              },
              icon: Icon(Icons.location_city_outlined),
              label: Text("Asasna")),
        ],
      ),
    );
  }
}
