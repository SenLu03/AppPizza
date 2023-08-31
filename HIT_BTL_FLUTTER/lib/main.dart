import 'package:btl_flutter/AppRouter/AppRouter.dart';
import 'package:btl_flutter/binding/AppBinding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'AppRouter/AppPage.dart';



void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, widget) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: AppBinding(),
        initialRoute: AppRouter.login,
        defaultTransition: Transition.fade,
        getPages: AppPage.pages,
        // supportedLocales: AppConstant.availableLocales,
        theme: ThemeData(
          primaryColor: Colors.white,
          fontFamily: 'SF-Pro-Display',
          textSelectionTheme: const TextSelectionThemeData(selectionHandleColor: Colors.transparent),
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
        ),
      ),
    ),
  );
}

