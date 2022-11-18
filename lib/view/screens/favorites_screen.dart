import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/product_controller.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class FavoriteScreen extends StatelessWidget {
 FavoriteScreen ({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx((){
        if(controller.favouritesList.isEmpty){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/images/heart.png"),

                  ),
                SizedBox(
                  height: 20,
                ),
                Text("Please, Add your favorites products." ,
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Get.isDarkMode ? Colors.white : Colors.black,

                ),
                ),
              ],
            ),
          );


        }else{
          return ListView.separated(
                itemBuilder: (context , index){
                  return buildFavItems(

image: controller.favouritesList[index].image,
                    price: controller.favouritesList[index].price,
                      title: controller.favouritesList[index].title,
                    productId: controller.favouritesList[index].id,
                  );
                },
                separatorBuilder: (context ,index){
                  return const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  );
                },
                itemCount: controller.favouritesList.length);

        }

      }

      ),
    );
  }
  Widget buildFavItems({

  required String image,
 required double price,
    required String title,
    required int productId,



}){



    return Padding(
      padding:const EdgeInsets.all(10),
    child: SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          SizedBox(
            child: Card(
              clipBehavior:Clip.antiAlias ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ) ,
              child: AspectRatio(aspectRatio: 1 ,
              child: Image.network(image,
              fit: BoxFit.cover ,),) ,
            ),
          ),
          const SizedBox(
            width: 15,
          ),

          Expanded(
            //عشان يقسم لي الكلام في اسطر اذا كان كلام كثير
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text("$title",
               overflow: TextOverflow.ellipsis,
               style: TextStyle(
                 color:Get.isDarkMode? Colors.white: Colors.black,
                 fontSize: 16,
                 fontWeight: FontWeight.bold,

               ),
               ),
               const SizedBox(
                  height: 10,
                ),
                Text("\$ $price",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color:Get.isDarkMode? Colors.white: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ],
            ),
          ),
        const Spacer(),
        IconButton(
            onPressed: (){

              controller.mangeFavourrites(productId);
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            size: 30,)
        ),
        ],
      ),
    ),);
    
  }
}