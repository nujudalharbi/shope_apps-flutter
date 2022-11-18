import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/auth_controller.dart';
import 'package:shop_app/logic/controllers/theme_controller.dart';
import 'package:shop_app/theme.dart';

import '../../utiils/theme.dart';

class Settingcreen extends StatelessWidget {
  const Settingcreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
        onPressed: () {
              Get.isDarkMode ?
              Get.changeThemeMode(ThemeMode.light) :
              Get.changeThemeMode(ThemeMode.dark);
              ThemeControler().changesTheme();
        },
        child: Text(
              "Dark Mode",
              style: TextStyle(color:Get.isDarkMode ? Colors.white : Colors.black),
        ),
      ),

              SizedBox(height: 20,),
              GetBuilder<AuthController>(
                builder:(controller){

                  return  TextButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: "Logout From App",
                        titleStyle :TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                        middleText: 'Are you sure you need to logout',
                        middleTextStyle: TextStyle(
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
                          Get.back();
                        },
                        onConfirm: (){
                          controller.signOutFromApp();
                        },
                        buttonColor: Get.isDarkMode ? pinkClr :mainColor,

                      );

// controller.signOutFromApp();
                    },
                    child: Text(
                      "LogOut",
                      style: TextStyle(color:Get.isDarkMode ? Colors.white : Colors.black),
                    ),
                  );
                } ,

              ),
            ],
          )),
    );
  }
}
