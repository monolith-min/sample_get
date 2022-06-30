import 'package:get/get.dart';
import 'package:sample_get/src/controller/battle_controller.dart';

class InitBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(BattleController(), permanent: true);
  }
}