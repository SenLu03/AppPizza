import 'package:btl_flutter/AppRouter/AppRouter.dart';
import 'package:btl_flutter/UI/Account/acount_screen.dart';
import 'package:btl_flutter/UI/ForgotPassWord/Screen/Screen1.dart';
import 'package:btl_flutter/UI/Main/Screen/MainScreen.dart';
import 'package:btl_flutter/UI/Main/Screen/map_screen.dart';
import 'package:btl_flutter/UI/change_inf/change_inf_screen.dart';
import 'package:btl_flutter/UI/login/Screen/LoginScreen.dart';
import 'package:btl_flutter/UI/register/Screen/register_screen.dart';
import 'package:btl_flutter/UI/state_main/state_main_screen.dart';
import 'package:btl_flutter/binding/LoginBinding.dart';
import 'package:btl_flutter/binding/MainBinding.dart';
import 'package:btl_flutter/binding/account_binding.dart';
import 'package:btl_flutter/binding/change_inf_binding.dart';
import 'package:btl_flutter/binding/change_pass_binding.dart';
import 'package:btl_flutter/binding/detal_biding.dart';
import 'package:btl_flutter/binding/forgot_pass_word_binding.dart';
import 'package:btl_flutter/binding/map_binding.dart';
import 'package:btl_flutter/binding/see_orderbinding.dart';
import 'package:btl_flutter/binding/setting_binding.dart';
import 'package:btl_flutter/binding/state_main_binding.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../UI/cart/cart.dart';
import '../UI/change_password/change_pass_screen.dart';
import '../UI/detail/vihe_detail_screen.dart';
import '../UI/see_order/see_order_screen.dart';
import '../UI/setting/setting_screen.dart';
import '../binding/cart_binding.dart';
import '../binding/register_bingdin.dart';


class AppPage {
  static final pages = [
    GetPage(
        name: AppRouter.mainScreen,
        page: () => const MainScreen(),
        binding: MainBinding()),
    GetPage(
        name: AppRouter.login,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: AppRouter.forgotPassWord,
        page: () => const ForgotPassWordScreen1(),
        binding: ForgotPassWordBingding()),
    GetPage(
        name: AppRouter.register,
        page: () => RegisterScreen(),
        binding: RegisterBinding()),
    GetPage(
        name: AppRouter.mapScreen,
        page: () => const MapScreen(),
        binding: MapBinding()),
    GetPage(
        name: AppRouter.settingScreen,
        page: () => SettingScreen(),
        binding: SettingBinding()),
    GetPage(
        name: AppRouter.stateMainScreen,
        page: () => StateMainScreen(),
        binding: StateMainBinding()),
    GetPage(
        name: AppRouter.accountScreen,
        page: () => AccountScreen(),
        binding: AccountBinding()),
    GetPage(
        name: AppRouter.changePassScreen,
        page: () => ChangePassScreen(),
        binding:ChangePassBinding()),
     GetPage(
        name: AppRouter.menu,
        page: () => const ShoppingCartScreen(),
        binding:CartBinding()),
    GetPage(
        name: AppRouter.detalScreen,
        page: () => ViHeDetailScreen(),
        binding:DetalBinding()),
    GetPage(
        name: AppRouter.changeInfScreen,
        page: () => ChangeInfScreen(),
        binding:ChangeInfBinding()),
    GetPage(
        name: AppRouter.seeOder,
        page: () => SeeOrderScreen(),
        binding:SeeOrderBinding()),
  ];
}
