import 'dart:core';

import 'package:get/get.dart';

class StageController extends GetxController {
  //static const _categories = ["TIWAL", "MIIN", "MATHANI", "MOFASAL"];
  RxString _stageCategorySelected = ''.obs;

  String get stageCategorySelected => _stageCategorySelected.value;

  set setStageCategorySelected(String cat) {
    _stageCategorySelected.value = cat;
  }

  RxInt _souraNbSelected = 1.obs;

  int get souraNbSelected => _souraNbSelected.value;

  set setSouraNbSelected(int souraNb) {
    _souraNbSelected.value = souraNb;
  }

  RxString _souraNameSelected = "al_fatiha".obs;

  String get souraNameSelected => _souraNameSelected.value;

  set setSouraNameSelected(String souraName) {
    _souraNameSelected.value = souraName;
  }

  RxBool _testSelected = false.obs;

  bool get testSelected => _testSelected.value;
  set setTestSelected(bool testS) {
    _testSelected.value = testS;
  }
}
