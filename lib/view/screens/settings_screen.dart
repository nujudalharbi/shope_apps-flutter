import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controllers/auth_controller.dart';
import 'package:shop_app/logic/controllers/theme_controller.dart';
import 'package:shop_app/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

import '../../utiils/theme.dart';
import '../widgets/settings/dark_mode_widget.dart';
import '../widgets/settings/logout_widget.dart';
import '../widgets/settings/profile_widget.dart';

class Settingcreen extends StatelessWidget {
  const Settingcreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,

body: ListView(
  padding: const EdgeInsets.all(24),
  children: [
  ProfileImage(),
    const SizedBox(height: 10,),

    Divider(
      color: Get.isDarkMode ? Colors.white : Colors.grey,),
   const SizedBox(
      height: 20,
    ),
    TextUtils(
        text: "GENERAL",
        fointSize: 18,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? pinkClr : mainColor,

        underLine: TextDecoration.none
    ),

    const SizedBox(
      height: 20,
    ),


    DarkModeWidget(),

    const SizedBox(
      height: 20,
    ),

    // LanguageWidget(),

    const SizedBox(
      height: 20,
    ),
    LogOutWidget(),

  ],
),








    );
  }
}
