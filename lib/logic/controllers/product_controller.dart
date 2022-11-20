


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/services/product_services.dart';

class ProductController extends GetxController{

var productList = <ProductModel>[].obs;
var favouritesList  = <ProductModel>[].obs;
var isLoading = true.obs;

var storge = GetStorage();

//search

  var searchList = <ProductModel>[].obs;

  TextEditingController searchTextController = TextEditingController();



//مثل init state
@override
void onInit(){
  super.onInit();
 List ? storedP =
  storge.read<List>("isFavouritesList");
 if(storedP != null){
   favouritesList = storedP.map((e) => ProductModel.fromJson(e)).toList().obs;


       // storedP.map((e) => ProductModel.fromjson(e)).toList().obs;

 }


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

//  logic for favourites screen
//عشان اضيف العنصر المحدد مو كل العناصر
void mangeFavourrites(int productId) async{
//  هينا انا احذف العنصر الذي يختاره المستخدم
var existingIndex = favouritesList.indexWhere((element) => element.id == productId);
print("=======");
print(existingIndex);
print("=======");
if(existingIndex >= 0){

  favouritesList.removeAt(existingIndex);
  await storge.remove("isFavouritesList");
}else {


  favouritesList.add( productList.firstWhere((element) => element.id == productId));

  await storge.write("isFavouritesList", favouritesList);
}

}

bool isFavourites (productId){

  return favouritesList.any((element) => element.id == productId);

}

//search bar logic

void addSearchToList(String searchName){

  searchName = searchName.toLowerCase();



  searchList.value = productList.where((search) {
    var searchTitle = search.title.toLowerCase();
    var searchPrice = search.price.toString().toLowerCase();

    return searchTitle.contains(searchName) || searchPrice.toString().contains(searchName);
  }).toList();

  update();

}



  void clearSearch(){

  searchTextController.clear();

  addSearchToList("");

  }

}