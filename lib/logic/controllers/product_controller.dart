


import 'package:get/get.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/product_services.dart';

class ProductController extends GetxController{

var productList = <ProductModel>[].obs;
var isLoading = true.obs;


//مثل init state
@override
void onInit(){
  super.onInit();
  //نستدعي الفانكشن عشان تعرض البيانات
  getProducts();
}


 void getProducts() async{

 var products = await  ProductServices.getProduct();
 try{
   isLoading(true);
   if(products.isNotEmpty){
productList.addAll(products);

   }
 }finally{
isLoading(false);

 }
  }
}