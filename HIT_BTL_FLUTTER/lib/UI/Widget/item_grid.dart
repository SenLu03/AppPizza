import 'package:btl_flutter/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Data/Product.dart';
import 'app_image_widget.dart';

class ItemGrid extends StatelessWidget {
  Product products;

  ItemGrid(this.products);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color:
                    const Color.fromARGB(255, 154, 152, 152).withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 2)
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6), topRight: Radius.circular(6)),
            child: SizedBox.fromSize(
              child: AppImageWidget.network(
                path: products.image,
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 10, right: 8, bottom: 8, top: 8),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                children: [
                   Expanded(
                    flex: 6,
                    child: Text(
                      products.name,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  )
                ],
              ),
              Text(
                  products.description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if(!Get.isRegistered<CartController>()){
                          Get.put(CartController());
                        }
                        Get.find<CartController>().listItem2.add(products);
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(150, 50)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        overlayColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 4, 203, 199)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 246, 205, 205)),
                      ),
                      child: Text(
                        "Thêm ${products.price}đ",
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
