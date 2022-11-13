




import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shop_app/view/screens/category_screen.dart';
import 'package:shop_app/view/screens/favorites_screen.dart';
import 'package:shop_app/view/screens/home_screen.dart';
import 'package:shop_app/view/screens/settings_screen.dart';

class MainController  extends GetxController{
  //للنفقيشن بار
  RxInt currentIndex = 0.obs;
  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    Settingcreen(),

  ].obs;


  final title = [
    "n shope",
    "categories",
    "favourites",
    "setting"
  ].obs;

}