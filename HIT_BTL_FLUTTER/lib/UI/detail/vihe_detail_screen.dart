import 'package:btl_flutter/controller/detal_controller.dart';
import 'package:btl_flutter/UI/dialog/select_drink.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dialog/choose_appetizer.dart';
import '../dialog/select.dart';

class ViHeDetailScreen extends GetView<DetalController> {
  List<String> itemList = [
    'Đế Giòn Xốp',
    'Đế Kéo Tay Truyền Thống',
    'Đế Mỏng Giòn'
  ];
  String selectedValue = '';
  bool showGridView = false;

  ViHeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Select.id = controller.bogoItem.product.id!;
    Select.cataloryId =controller.bogoItem.product.categoryId!;
    controller.context=context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            )),
        title: const Center(
            child: Text(
          "Tùy chỉnh Combo",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
        )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Image.network(controller.bogoItem.product.image ?? ''),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    controller.bogoItem.product.name ?? ' ',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                 
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
              child: Column(
                children: [
                  Text(
                    controller.bogoItem.product.description ?? '',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  )
                ],
              ),
            ),
            Select(),
            Choose_Appetizer(),
            Select_drink(),
          
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () {
                  controller.onPressAdd();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 41, 128, 42),
                  padding: const EdgeInsets.symmetric(
                      horizontal:
                          16.0), // Tăng padding ngang để tạo khoảng cách với lề màn hình
                  minimumSize: const Size(250,
                      60), // Sử dụng minimumSize để làm nút button chiếm hết chiều ngang
                ),
                child: const Text(
                  "Thêm vào giỏ hàng",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
