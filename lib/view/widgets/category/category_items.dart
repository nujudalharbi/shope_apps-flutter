

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/cart_controoler.dart';
import 'package:shop_app/logic/controllers/category_controller.dart';
// import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/product_controller.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/theme.dart';
import 'package:shop_app/view/screens/product_details_product.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

import '../../../utiils/theme.dart';
class CategoryItems extends StatelessWidget {

  final String categoryTitle;
  CategoryItems({Key? key, required this.categoryTitle}) : super(key: key);


  final controller = Get.find<ProductController>();

  final cartController = Get.find<CartController>();

  final categoryContrroler = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: context.theme.backgroundColor ,
      appBar: AppBar(
        title: Text("$categoryTitle"),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor  ,
      ),
      body: Obx((){

        if(categoryContrroler.isAllCategory.value){


          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr: mainColor  ,
            ),
          );
        }else {
          return  GridView.builder(
              itemCount: categoryContrroler.categoryList.length ,
              gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(

                childAspectRatio: 0.8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 6.0,
                maxCrossAxisExtent: 200,

              ),
              itemBuilder: (context , index){


                return buildCardItems(
                    image: categoryContrroler.categoryList[index].image,
                    price: categoryContrroler.categoryList[index].price,
                    rate:  categoryContrroler.categoryList[index].rating.rate,
                    productId: categoryContrroler.categoryList[index].id,
                    productModel: categoryContrroler.categoryList[index],
                    onTap: () {

                      Get.to(() => ProductDetailsScreen(productModel: categoryContrroler.categoryList[index], ));
                    }
                );

              }





          );
        }

      })

    );

  }
  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModel productModel,
    required Function() onTap

  }){
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(

        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),

            ],
          ),
          child:Column(
            children: [
              Obx(() =>   Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){
                      controller.mangeFavourrites(productId);

                    },
                    icon: controller.isFavourites(productId) ?

                    Icon(Icons.favorite
                      , color: Colors.red,) :
                    Icon(Icons.favorite_outline
                      , color: Colors.black,),
                  ),
                  IconButton(
                    onPressed: (){
                      cartController.addProductTotalCart(productModel);

                    },
                    icon: const Icon(Icons.shopping_cart
                      , color: Colors.black,),
                  ),
                ],
              ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Image.network(image ,
                  fit: BoxFit.fitHeight,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15 ,right: 15 ,top:5 ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text("\$ $price" ,
                      style: const TextStyle
                        (color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height:20 ,
                      width: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: Padding(padding: EdgeInsets.only(left: 3,right: 2),
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                          children: [
                            TextUtils(text: "$rate",
                                fointSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                underLine: TextDecoration.none),
                            const Icon(
                              Icons.start,
                              color: Colors.white,
                              size: 13,)
                          ],
                        ),
                      ),
                    ),
                  ],

                ),
              ),

            ],
          ) ,
        ),
      ) ,


    );

  }

}
