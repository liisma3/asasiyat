import 'package:asasiyat/controllers/stage_controller.dart';
import 'package:get/get.dart';

class AsasBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => StageController());
  }
}
