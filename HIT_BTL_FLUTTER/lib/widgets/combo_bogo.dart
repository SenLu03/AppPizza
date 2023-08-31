import 'package:btl_flutter/UI/Widget/item_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bogo_controller.dart';

class BoGoScreen extends GetView<BogoController> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Obx(
            () => ListView.builder(
              itemCount: controller.getData.length,
              itemBuilder: (context, index) {
                return ItemList(controller.getData[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
