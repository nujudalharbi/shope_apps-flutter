


import 'package:flutter/material.dart';

import 'package:get/utils.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utiils/my_string.dart';

class SettingController extends GetxController{
 //  var swithchValue = false.obs;
 //  var storage = GetStorage();
 // var langLocal = ene;

  var switchValue = false.obs;

  var storge = GetStorage();

  var langLocal = ene;

  String capitalize(String profileName){

    return profileName.split(" ").map((name) => name.capitalize).join(" ");

  }



//  languge


  @override
  void onInit() async {

    super.onInit();

    langLocal = await getLanguage;
  }
void saveLanguage(String lang) async{

    await storge.write("lang", lang);

}

Future<String> get getLanguage async{
return await storge.read("lang");
}


void changeLanguage(String typeLang){

  saveLanguage(typeLang);

    if(langLocal == typeLang)
{

  return;
}
    if(typeLang == frf){
      langLocal = frf;
saveLanguage(frf);
    }
    else if (typeLang == ara){
      langLocal = ara;
saveLanguage(frf);
    }else{
      langLocal = ene;
      saveLanguage(ene);

    }
    update();
}









}


