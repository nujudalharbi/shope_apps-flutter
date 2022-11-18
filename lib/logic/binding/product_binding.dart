





import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/cart_controoler.dart';
import 'package:shop_app/logic/controllers/product_controller.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    // TODO: implement dependencies
  }

}