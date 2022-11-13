import 'package:get/get.dart';
import 'package:shop_app/logic/binding/main_binding.dart';
import 'package:shop_app/view/screens/auth/forgot_password.dart';
import 'package:shop_app/view/screens/auth/login_screen.dart';
import 'package:shop_app/view/screens/auth/signup_screen.dart';
import 'package:shop_app/view/screens/welcome_screen.dart';

import '../logic/binding/auth_biniding.dart';
import '../view/screens/main_screen.dart';

class AppRoutes{


//  initialRoute
static const welcome = Routes.welcomeScreen ;
static const mainScreen  = Routes.mainScreen;

//getPages

static final routes =[
  GetPage(
    name: Routes.welcomeScreen,
    page: () => WelcomeScreen(),
  ),
  GetPage(
    name: Routes.loginScreen,
    page: () => LoginScreen(),
      binding: AuthBinding()
  ),
  GetPage(
    name: Routes.signupScreen,
    page: () => SignUpScreen(),
    binding: AuthBinding()
  ),
  GetPage(
      name: Routes.forgetPasswordScreen ,
      page: () => ForgetPasswordScreen(),
      binding: AuthBinding()
  ),

  GetPage(
      name: Routes.mainScreen ,
      page: () => MainScreen(),
      bindings: [AuthBinding(),MainBindng()],

  ),

];


}


class Routes{

  static const welcomeScreen = '/WelcomeScreen';
  static const loginScreen = '/LoginScreen';
  static const signupScreen = '/SignUpScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/MainScreen';
}