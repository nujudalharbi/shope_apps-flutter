



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/routes/routes.dart';
import '../../utiils/theme.dart';

class CartController extends GetxController{
// List<ProductModel> favoritesList = [
//   ProductModel(
//       id: 1,
//       title: "title",
//       price: 10.9,
//       description: "description",
//       category: null,
//       image: "image",
//       rating: Rating.fromJson({}),
//   ),
// ];



var productsMap = {}.obs;

void addProductTotalCart(ProductModel productModels ){
  if(productsMap.containsKey(productModels)){

    productsMap[productModels] += 1 ;

    
    
    print(productsMap.value.toString());

    // print( productsMap.entries.map((e) => e.key.price * e.value).toList());
    // print( productsMap.entries.map((e) => e.key.price * e.value).toList().reduce((value, element) => value + element).toStringAsFixed(2));
  }else {

    productsMap[productModels] = 1;

    // productsMap.entries.map((e) => e.key.price * e.value).toList();
    print(productsMap.value.toString());
    // print( productsMap.entries.map((e) => e.key.price * e.value).toList());

    // print( productsMap.entries.map((e) => e.key.price * e.value).toList().reduce((value, element) => value + element).toStringAsFixed(2));
  }
}

void removeProductFarmCart(ProductModel productModel){
  if(productsMap.containsKey(productModel) && productsMap[productModel] == 1){
    productsMap.removeWhere((key, value) => key == productModel);

  }else{

    productsMap[productModel] -= 1;

  }

  // Get.snackbar(
  //   "Error!",
  //   "$productsMap["
  //   snackPosition: SnackPosition.BOTTOM,
  //   backgroundColor: Colors.green,
  //   colorText: Colors.white,
  // );
}


  void removeOneProduct(ProductModel productModel){

    productsMap.removeWhere((key, value) => key == productModel);
  }

  void clearAllProducts(){

    Get.defaultDialog(
      title: "Clean Products",
      titleStyle :TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),
      middleText: 'Are you sure you need clear product ',
      middleTextStyle: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: "No",
      cancelTextColor: Colors.white,
      textConfirm: "YES",
      confirmTextColor: Colors.white,
      onCancel: (){
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: (){
        productsMap.clear();
          Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr :mainColor,

    );








  }

get productSubTotal => productsMap.entries.map((e) => e.key.price * e.value).toList();

get total  => productsMap.entries.map((e) => e.key.price * e.value)
    .toList().reduce((value, element) => value + element).toStringAsFixed(2);


int quantity(){
if(productsMap.isEmpty){
  return 0;
}else {
  return productsMap.entries
      .map((e) => e.value)
      .toList()
      .reduce((value, element) => value + element);

}








}




}