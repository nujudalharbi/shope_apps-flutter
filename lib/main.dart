import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/logic/controllers/theme_controller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/theme.dart';
import 'package:shop_app/view/screens/welcome_screen.dart';

import 'utiils/theme.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'shope',
      debugShowCheckedModeBanner: false,
    theme: ThemesApp.light,
    darkTheme: ThemesApp.dark,
  themeMode: ThemeControler().themeDataGet,
        initialRoute: FirebaseAuth.instance.currentUser != null ||
            GetStorage().read<bool>('auth') == true ? AppRoutes.mainScreen : AppRoutes.welcome,
      getPages: AppRoutes.routes


    );
  }
}
