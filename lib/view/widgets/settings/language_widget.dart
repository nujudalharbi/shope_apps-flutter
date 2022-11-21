



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_app/logic/controllers/setting_controller.dart';

import '../../../utiils/my_string.dart';
import '../../../utiils/theme.dart';
import '../text_utils.dart';

class LanguageWidget extends StatelessWidget {
   LanguageWidget({Key? key}) : super(key: key);

  final controller =Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (_) =>
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              color : Colors.transparent,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: languageSettings,

                    ),
                    child: const  Icon(
                      Icons.language,
                      color: Colors.white,
                    ) ,
                  ),
                  const SizedBox(
                    width: 20,
                  ),

                  TextUtils(
                      text: "Language".tr,
                      fointSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      underLine: TextDecoration.none
                  ),
                ],
              ),
            ),

            Container(
              width: 120,
              padding: EdgeInsets.symmetric(horizontal: 6 , vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: Get.isDarkMode ? Colors.white  : Colors.black ,
                    width: 2
                ),


              ),
              child: DropdownButtonHideUnderline (
                child: DropdownButton<String> (



                  iconSize: 25 ,



                  icon: Icon(Icons.arrow_drop_down,
                    color: Get.isDarkMode ? Colors.white : Colors.black,),
                  items: [
                    DropdownMenuItem(child:
                    Text(

                      english ,

                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                      value: ene  ,

                    ),

                    DropdownMenuItem(child:
                    Text(

                      arabic,

                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                      value: ara,
                    ),
                    DropdownMenuItem(child:
                    Text(

                      france ,

                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                      value: frf,

                    ),
                  ],

                  value: controller.langLocal
                  ,

                  onChanged: (value) {
                   controller.changeLanguage(value!);

                   Get.updateLocale(Locale(value));
                   
                  },
                  //
                ),
              ),
            ) ,

          ],
        ));
  }
}






























// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../logic/controllers/setting_controller.dart';
// import '../../../utiils/theme.dart';
// import '../text_utils.dart';
//
// class LanguageWidget extends StatelessWidget {
//   LanguageWidget({Key? key}) : super(key: key);
//
//   final controller = Get.find<SettingController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<SettingController>(
//       builder: (_) => Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Material(
//             color: Colors.transparent,
//             child: Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(6),
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: languageSettings,
//                   ),
//                   child: const Icon(
//                     Icons.language,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 TextUtils(
//
//                   fontWeight: FontWeight.bold,
//                   text: "Language".tr,
//                   color: Get.isDarkMode ? Colors.white : Colors.black,
//                   underLine: TextDecoration.none, fointSize: 20,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: 120,
//             padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(13),
//               border: Border.all(
//                 color: Get.isDarkMode ? Colors.white : Colors.black,
//                 width: 2,
//               ),
//             ),
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<String>(
//                 iconSize: 25,
//                 icon: Icon(
//                   Icons.arrow_drop_down,
//                   color: Get.isDarkMode ? Colors.white : Colors.black,
//                 ),
//                 items: [
//                   DropdownMenuItem(
//                     child: Text(
//                       english,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     value: ene,
//                   ),
//                   DropdownMenuItem(
//                     child: Text(
//                       arabic,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     value: ara,
//                   ),
//                   DropdownMenuItem(
//                     child: Text(
//                       france,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     value: frf,
//                   ),
//                 ],
//                 value: controller.langLocal,
//                 onChanged: (value) {
//                   controller.changeLanguage(value!);
//                   Get.updateLocale(Locale(value));
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }