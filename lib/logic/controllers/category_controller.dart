



import 'package:get/get.dart';
import 'package:shop_app/models/product_model.dart';

import '../../services/category_service.dart';

class CategoryController  extends GetxController{

  var categoryNameList = <String>[].obs;

  var categoryList = <ProductModel>[].obs;

  var isCategoryLoading = false.obs;

  var isAllCategory = false.obs;
  //--------------

  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategorys();

  }
  void getCategorys()async{
    var categoryName = await CategoryServices.getCategory();


    try{
      isCategoryLoading(true);
     if(categoryName.isNotEmpty){

       categoryNameList.addAll(categoryName);

     }

    } finally{

      isCategoryLoading(false);

        }
  }



   getAllCategorys(String namecategory)async{

    isAllCategory(true);
    categoryList.value =  await AllCategoryServices.getAllCategory(namecategory);








      isAllCategory(false);


  }


  getCategoryIndex(int index) async {
   var categoryAllName = await getAllCategorys(categoryNameList[index]);

   if(categoryAllName != null ){
 categoryList.value = categoryAllName;


   }




  }
}