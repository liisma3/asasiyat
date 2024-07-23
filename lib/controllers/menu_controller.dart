import 'package:asasiyat/app_routes.dart';
import 'package:asasiyat/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = "".obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
    activeItem.value = itemName;
  }

  bool isActive(String itemName) {
    if (activeItem.value == itemName)
      return true;
    else
      return false;
  }

  bool isHovering(String itemName) {
    if (hoverItem.value == itemName)
      return true;
    else
      return false;
  }

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case OverviewPageRoute:
        return _customIcon(Icons.trending_up, itemName);

      case StagesPageRoute:
        return _customIcon(Icons.diamond, itemName);
      case SprintsPageRoute:
        return _customIcon(Icons.settings_power_outlined, itemName);

      case GuestsPageRoute:
        return _customIcon(Icons.people_alt, itemName);

      case HostsPageRoute:
        return _customIcon(Icons.cable, itemName);
      case LoginPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);

      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName))
      return Icon(icon, size: 22, color: AsasStyle.darkColor);
    return Icon(
      icon,
      color:
          isHovering(itemName) ? AsasStyle.darkColor : AsasStyle.lightGreyColor,
    );
  }
}
