import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';

class ShoppingCartScreen extends GetView<CartController> {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.context=context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Giỏ Hàng'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.only(
                bottom: 70.sp,
              ),
              child: Obx(
                () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.listItem2.length,
                    itemBuilder: (context, index) =>
                        ItemCart(controller.listItem2.value[index],2)),
              ),
            ),
          ),
          Positioned(bottom: 0.sp, child: bottom()),
        ],
      ),
    );
  }

  Widget bottom() {
    controller.cacuTotalPrice();
    return Container(
      height: 70.sp,
      decoration: const BoxDecoration(color: Colors.green),
      width: Get.width,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10.sp,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Text(
                      'Tổng tiền: ${controller.totalPrice} VND',
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                  onPressed: () => {controller.onPressOder()},
                  child: Icon(
                    Icons.shopping_cart,
                    size: 40.sp,
                    color: Colors.white,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemCart extends GetView<CartController> {
  var item;
  int listNumber;


  ItemCart(this.item, this.listNumber);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10.sp),
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color:
                    const Color.fromARGB(255, 159, 159, 159).withOpacity(0.8),
                spreadRadius: 1,
                blurRadius: 4)
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  ' ${item.name }',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 5.sp,),
                Text('       ${item.productName}'),
                SizedBox(height: 5.sp,),
                Text('       ${item.sizeName ?? ''}'),
                SizedBox(height: 5.sp,),
                Text('       ${item.cakeBaseName ?? ''}'),
                SizedBox(height: 5.sp,),
                Text('       Giá tiền: ${item.price} VND'),
                SizedBox(height: 5.sp,),
                Text('       Số lượng: ${item.quatity}'),
                // Text('Product Price: ${controller.productPrice}'),
                // Add other shopping cart components here
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                if(listNumber==1) {
                  controller.listItem.remove(item);
                }
                else {
                  controller.onPressDelele(item.id);
                }
                controller.cacuTotalPrice();
              },
              icon: Text(
                'X',
                style: TextStyle(fontSize: 20.sp, color: Colors.red),
              ))
        ],
      ),
    );
  }
}
