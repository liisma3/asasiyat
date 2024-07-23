import 'dart:core';

import 'package:asasiyat/constants/data_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AsasController extends GetxController {
  static Map<String, List<Map<String, dynamic>>>? _categories =
      DataHelper.CategoryLabel;
  //static const _categories = ["TIWAL", "MIIN", "MATHANI", "MOFASAL"];
  RxInt _bottomNavIndex = 0.obs;
  RxBool _isDark = false.obs;
  RxInt currentIndex = 0.obs;

  RxString _categorySelected = _categories!.keys.toList()[0].obs;

  String get categorySelected => _categorySelected.value;

  set setCategorySelected(String cat) {
    _categorySelected.value = cat;
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

  RxBool isLogged = false.obs;
  RxList<Map<String, dynamic>> _souraAsasList =
      RxList.from(DataHelper.CategoryLabel['MOFASAL'] as Iterable);
  RxBool _isCategorySelected = false.obs;
  RxBool _isSouraSelected = false.obs;
  RxBool _asasTest = false.obs;
  RxInt _souraSelectedNb = 0.obs;
  RxString _category = DataHelper.CategoryLabel.keys.toList()[0].obs;

  bool get asasTest => _asasTest.value;

  set asasTest(bool tst) {
    _asasTest.value = tst;
  }

  set souraAsasList(cat) {
    _souraAsasList.value =
        DataHelper.CategoryLabel["$cat"] as List<Map<String, dynamic>>;
  }

  List<Map<String, dynamic>> get souraAsasList => _souraAsasList.value;
//shuffeled
  RxList<Map<String, dynamic>> _souraShuffeledAsasList =
      RxList.from(DataHelper.CategoryLabel['MOFASAL'] as Iterable);
  set souraShuffeledAsasList(cat) {
    _souraShuffeledAsasList.value =
        DataHelper.CategoryLabel["$cat"] as List<Map<String, dynamic>>;
  }

  List<Map<String, dynamic>> get souraShuffeledAsasList =>
      _souraShuffeledAsasList;
  int get bottomNavIndex {
    return _bottomNavIndex.value;
  }

  set bottomNavIndex(int ind) {
    _bottomNavIndex.value = ind;
  }

  set categorySelected(String cat) {
    _categorySelected.value = cat;
  }

  get categories {
    return _categories.obs;
  }

  bool get isCategorySelected => _isCategorySelected.value;

  bool get isSouraSelected => _isSouraSelected.value;
  bool get isDark {
    return _isDark.value;
  }

  set isDark(isd) {
    _isDark.value = isd;
  }

  void changeLangage(var param1, var param2) {
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
  }

  set souraSelectedNb(int? value) {
    _souraSelectedNb.value = value!;
  }

  String get category {
    return _category.value;
  }

  set category(String cat) {
    _isSouraSelected.value = cat.obs as bool;
  }

  set isSouraSelected(bool souraSel) {
    _isSouraSelected.value = souraSel;
  }

  int get souraSelectedNb {
    return _souraSelectedNb.value;
  }

/*   var _category;
  Stage stage = Stage.initStage();

  AsasController() {
    //

  }

  set isCategorySelected(sel) => _isCategorySelected.value = sel;

  set category(cat) {
    _category.value = cat;
  }

 */
/*   var _souraAlAsasList = DataHelper.tiwal.obs;
 
  //late int alAsasListLength = _souraAlAsasList.length;
  late var _shuffeledSoura = shuffleSoura(_souraAlAsasList).obs;
  int guestToken = -1.obs;
  int hostToken = -1.obs;
  
/* 

 */
  List? get shuffeled {
    return _shuffeledSoura.value;
  }

  List? get souraAlAsasList {
    return _souraAlAsasList;
  }

  set shuffeled(newShuffeled) {
    _shuffeledSoura.value = newShuffeled;
  }

  set souraAlAsasList(souraAlas) {
    _shuffeledSoura.value = souraAlas;
  }

  @override
  void onInit() {
    super.onInit();
    //categories(DataHelper.CategoryLabel.keys.toList());

    late List<Color> colorList =
        List.generate(_souraAlAsasList.length, (index) {
      return Colors.primaries[index];
    }).obs;

//    List<Stage> stages = [];
  }

  List? shuffleSoura(List _souraAlAsasListContext) {
    var random = new Random();
    for (var soura in _souraAlAsasListContext) {
      print("${soura["souraName"]} : ${soura["souraNb"]}");
    }
    List _shuffled =
        new List<Map<String, Object>>.from(_souraAlAsasListContext);
    // Go through all elements.
    for (var i = _souraAlAsasListContext.length - 1; i > 0; i--) {
      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = _shuffled[i];
      _shuffled[i] = _shuffled[n];
      _shuffled[n] = temp;
    }
    return _shuffled;
// TabViews Widget
  }
 */
}
