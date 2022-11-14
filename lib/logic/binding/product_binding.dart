





import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/product_controller.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductController());
    // TODO: implement dependencies
  }

}