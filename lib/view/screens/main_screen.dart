import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/main_controller.dart';
import 'package:shop_app/theme.dart';

import '../../logic/controllers/cart_controoler.dart';
import '../../routes/routes.dart';
import '../../utiils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
final controller = Get.find<MainController>();

  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx ((){

        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            leading: Container(),
            actions: [



       Obx(() =>
           Badge(
               position: BadgePosition.topEnd(top: 0, end: 3),
               animationDuration: Duration(milliseconds: 300),
               animationType: BadgeAnimationType.slide,
               badgeContent:   Text(
                 cartController.quantity().toString(),
                 style: const  TextStyle(color: Colors.white),
               ),
               child:  IconButton(
                   onPressed: () {
                     Get.toNamed(Routes.cartScreen);
                   }, icon:
               Image.asset("assets/images/shop.png")
               )),),


            ],
            backgroundColor:Get.isDarkMode?  darkGreyClr :  mainColor,
            // titleعشان الاب بار يتغير مع النفيقيشن بار ويجي السم الصفحه نفسه
            title: Text(controller.title[controller.currentIndex.value]),
            centerTitle: true,
          ),

          //لعمل النفقيشن بار
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode? darkGreyClr : Colors.white,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.home,
                      color: Get.isDarkMode? pinkClr :  mainColor) ,
                  icon:Icon(Icons.home,
                      color: Get.isDarkMode? Colors.white : Colors.black
                  ),
                  label: ''),

              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.category,
                      color: Get.isDarkMode? pinkClr :  mainColor) ,
                  icon:Icon(Icons.category,
                      color: Get.isDarkMode? Colors.white : Colors.black
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.favorite,
                      color: Get.isDarkMode? pinkClr :  mainColor) ,
                  icon:Icon(Icons.favorite,
                      color: Get.isDarkMode? Colors.white : Colors.black
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.settings,
                      color: Get.isDarkMode? pinkClr :  mainColor) ,
                  icon:Icon(Icons.settings,
                      color: Get.isDarkMode? Colors.white : Colors.black
                  ),
                  label: ''),
            ],
            onTap: (index){
              controller.currentIndex.value = index;
            } ,
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs.value,
          ),
        );
      }

      )
    );
  }
}
