

import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:shop_app/logic/controllers/main_controller.dart';

class MainBindng extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
    // TODO: implement dependencies
  }


}