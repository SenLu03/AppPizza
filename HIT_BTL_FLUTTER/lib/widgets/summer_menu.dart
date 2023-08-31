import 'package:btl_flutter/UI/Widget/item_grid.dart';
import 'package:btl_flutter/controller/menu_controller.dart' as menu;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../UI/Widget/item_grid_2.dart';

class SummerMenu extends GetView<menu.MenuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.listSummerMenu.isEmpty
            ? const SizedBox()
            : GridView.builder(
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.48),
                itemBuilder: (context, index) {
                  if (index >= 4) {
                    return ItemGrid(controller.listSummerMenu.value[index + 4]);
                  }
                  return ItemGrid02(controller.listSummerMenu.value[index]);
                },
              ),
      ),
    );
  }
}
