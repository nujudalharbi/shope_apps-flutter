

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeControler{


  final GetStorage boxStorage = GetStorage();
  final key = 'isDarkModes';
saveThemeDataInbOX(bool isDark){
boxStorage.write(key, isDark);
}
bool getThemeDataFromBox(){
  return boxStorage.read<bool>(key) ?? false;
}

ThemeMode get themeDataGet => getThemeDataFromBox() ?ThemeMode.dark : ThemeMode.light;


void changesTheme(){
  Get.changeThemeMode(
      getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);
  saveThemeDataInbOX(!getThemeDataFromBox());

}
}