

import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:shop_app/logic/controllers/main_controller.dart';
import 'package:shop_app/logic/controllers/setting_controller.dart';

class MainBindng extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
    // TODO: implement dependencies
  }


}