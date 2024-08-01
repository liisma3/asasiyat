import 'dart:core';

import 'package:asasiyat/constants/data_helper.dart';
import 'package:asasiyat/models/stage_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StageController extends GetxController {
  //static const _categories = ["TIWAL", "MIIN", "MATHANI", "MOFASAL"];
  @override
  onInit() {
    try {
      GetStorage asasStorage = GetStorage();
      //var guestRegistred;
      if (asasStorage.read('guestRegistred') != null) {
        setGuestRegistred = asasStorage.read('guestRegistred');
      }
      if (asasStorage.read('hostRegistred') != null) {
        setGuestRegistred = asasStorage.read('hostRegistred');
      }
      if (asasStorage.read('phoneRegistred') != null) {
        setGuestRegistred = asasStorage.read('phoneRegistred');
        ever(_guestRegistred, (value) => print("$value guest registred !!!"));
      }
    } catch (e) {}

    super.onInit();
  }

  Stage stageState = Stage(souraName: '', souraNb: 0, grid: 0);

  RxString _stageCategorySelected = 'TIWAL'.obs;

  String get stageCategorySelected => _stageCategorySelected.value;
  RxString _categorySelected = 'TIWAL'.obs;
  String get categorySelected => _categorySelected.value;
  set setCategorySelected(String cat) {
    print("cat  $cat");
    _categorySelected.value = cat;
    update();
  }

//____________categories
  static List<String>? _categories = DataHelper.CategoryLabel.keys.toList();

  List<String>? get categories => _categories;

// souraAsasList
  RxList<Map<String, dynamic>> _souraAsasList =
      RxList.from(DataHelper.CategoryLabel['MOFASAL'] as Iterable);

  set souraAsasList(cat) {
    _souraAsasList.value =
        DataHelper.CategoryLabel["$cat"] as List<Map<String, dynamic>>;
  }

  List<Map<String, dynamic>> get souraAsasList => _souraAsasList;
//Asas test
  RxBool _asasTest = false.obs;

  bool get asasTest => _asasTest.value;

  set asasTest(bool tst) {
    _asasTest.value = tst;
  }

// shuffeled
  RxList<Map<String, dynamic>> _souraShuffeledAsasList =
      RxList.from(DataHelper.CategoryLabel['MOFASAL'] as Iterable);
  set souraShuffeledAsasList(cat) {
    _souraShuffeledAsasList.value =
        DataHelper.CategoryLabel["$cat"] as List<Map<String, dynamic>>;
  }

  List<Map<String, dynamic>> get souraShuffeledAsasList =>
      _souraShuffeledAsasList;

//__________________souraName selected

  set setStageCategorySelected(String cat) {
    _stageCategorySelected.value = cat;
  }

//____________souraNb Selected
  RxInt _souraNbSelected = 1.obs;

  int get souraNbSelected => _souraNbSelected.value;

  set setSouraNbSelected(int souraNb) {
    _souraNbSelected.value = souraNb;
  }

//__________________souraName selected
  RxString _souraNameSelected = "".obs;

  String get souraNameSelected => _souraNameSelected.value;

  set setSouraNameSelected(String souraName) {
    _souraNameSelected.value = souraName;
    update();
  }

//____________________test Selected
  RxBool _testSelected = false.obs;

  bool get testSelected => _testSelected.value;
  void set setTestSelected(bool testS) {
    _testSelected.value = testS;
    update();
  }

// pause stage
//____________________test Selected
  RxBool _paused = false.obs;

  bool get paused => _paused.value;
  void set setPaused(bool pause) {
    stageState.paused = !stageState.paused;
    _paused.value = pause;
    update();
  }

//__________________sort soura Nb list
  RxList<int> _sortSouraNb = [0].obs;

  List<int>? get sortSouraNb => _sortSouraNb.value;
  set addToSortSouraNb(int sNb) {
    _sortSouraNb.value = [...sortSouraNb!, sNb];
  }

// ________________grid Nb
  RxInt _gridNb = 0.obs;
  set setGridNb(int setGridNb) {}

  int get gridNb => _gridNb.value;
  set setGrigNb(int gNb) {
    _gridNb.value = gNb;
  }

//____ isGuest
  RxBool _isGuest = false.obs;

  bool get isGuest => _isGuest.value;
  set setIsGuest(bool isG) {
    _isGuest.value = isG;
  }

//__ guest registred
  RxInt _guestRegistred = 0.obs;

  int get guestRegistred => _guestRegistred.value;
  set setGuestRegistred(int gRe) {
    _guestRegistred.value = gRe;
  }

// host
  RxInt _hostRegistred = 0.obs;

  int get hostRegistred => _hostRegistred.value;
  set setHostRegistred(int gRe) {
    _hostRegistred.value = gRe;
  }

// phone
  RxInt _phoneRegistred = 0.obs;

  int get phoneRegistred => _phoneRegistred.value;
  set setPhoneRegistred(int gRe) {
    _phoneRegistred.value = gRe;
  }
//______Guest Object
/*   Rx _phoneRegistred = 0.obs;

  int get phoneRegistred => _phoneRegistred.value;
  set setPhoneRegistred(int gRe) {
    _phoneRegistred.value = gRe;
  }
 */
}
