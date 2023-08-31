import 'package:btl_flutter/controller/see_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeOrderScreen extends GetView<SeeOrderController> {
  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Đơn hàng được đặt'),
      ),
      body: Obx(
        () => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.listItem2.length,
            itemBuilder: (context, index) =>
                ItemCart(controller.listItem2.value[index], 2)),
      ),
    );
  }
}

class ItemCart extends GetView<SeeOrderController> {
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
                SizedBox(
                  height: 5.sp,
                ),
                Text('       Trạng thái: đang giao ,  Giá tiền: ${item.totalMoney}VND'),
                const Text('       Địa chỉ: Hà Nội'),

                // Text('Product Price: ${controller.productPrice}'),
                // Add other shopping cart components here
              ],
            ),
          ),
        ],
      ),
    );
  }
}
