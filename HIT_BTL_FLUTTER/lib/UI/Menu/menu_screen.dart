import 'package:btl_flutter/AppRouter/AppRouter.dart';
import 'package:btl_flutter/controller/cart_controller.dart';
import 'package:btl_flutter/controller/menu_controller.dart' as menu;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/combo_bogo.dart';
import '../../widgets/combo_kidsbox.dart';
import '../../widgets/combo_limo_combo.dart';
import '../../widgets/combo_mybox.dart';
import '../../widgets/combo_vihe.dart';
import '../../widgets/monkhaivi.dart';
import '../../widgets/my_y_va_com.dart';
import '../../widgets/pizza_screen.dart';
import '../../widgets/summer_menu.dart';
import '../../widgets/thucuong.dart';

class MenuScreen extends GetView<menu.MenuController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return DefaultTabController(
      length: 10,
      child: Scaffold(
          appBar: AppBar(
            leading: const SizedBox(),
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/KidsBox/logopizzahut.jpg',
                  fit: BoxFit.cover,
                  height: 40,
                  width: 180,
                ),
              ],
            ),
            actions: [
              Container(
                width: 60,
                margin: const EdgeInsets.only(right: 20),
                child: IconButton(
                  onPressed: () {
                    if (!Get.isRegistered<CartController>()) {
                      Get.put(CartController());
                    }
                    Get.toNamed(AppRouter.menu);
                  },
                  icon: Row(
                    children: [
                      Column(
                        children: [
                          Icon(
                            CupertinoIcons.cart,
                            size: 32.sp,
                            color: Colors.black,
                          ),
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(
                              ( Get.find<CartController>()
                                          .listItem2
                                          .length)
                                  .toString(),
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              indicatorPadding:
                  const EdgeInsets.only(bottom: 8, top: 6, left: 5, right: 5),
              labelStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              labelPadding: const EdgeInsets.symmetric(horizontal: 15),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicator: BoxDecoration(
                color: const Color.fromARGB(255, 216, 45, 96),
                borderRadius: BorderRadius.circular(8.0),
              ),
              tabs: const [
                Tab(text: "Summer menu"),
                Tab(text: "Vị Hè"),
                Tab(text: "Kids Box"),
                Tab(text: "Mua 1 được 3"),
                Tab(text: "My Box"),
                Tab(text: "LIMO & COMBO"),
                Tab(text: "Pizza"),
                Tab(text: "Mỳ ý và cơm"),
                Tab(text: "Món khai vị"),
                Tab(text: "Thức uống"),
              ],
            ),
            backgroundColor: Colors.white,
          ),
          backgroundColor: const Color.fromARGB(255, 245, 242, 242),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        flex: 1,
                        child: TabBarView(
                          children: [
                            SummerMenu(),
                            const ViHe(),
                            const KidsBox(),
                            BoGoScreen(),
                            const MyBoxScreen(),
                            const ComboAndLiMoScreen(),
                            const PizzaScreen(),
                            const MyYvaCom(),
                            const MonKhaiVi(),
                            const ThucUong(),
                          ],
                        ))
                  ]),
            ),
          )),
    );
  }
}
