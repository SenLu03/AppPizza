import 'package:btl_flutter/UI/Widget/app_image_widget.dart';
import 'package:btl_flutter/UI/login/Component/Logo/Logo.dart';
import 'package:btl_flutter/call_API/get_api.dart';
import 'package:btl_flutter/call_API/post_api.dart';
import 'package:btl_flutter/controller/AppControler.dart';
import 'package:btl_flutter/controller/cart_controller.dart';
import 'package:btl_flutter/controller/discount_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Data/Product.dart';

class DiscoutScreen extends GetView<DiscountController> {
  const DiscoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.updatePoint();
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(child: Logo()),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10.sp,
                  ),
                  Text(
                    'Điểm hiện tại của bạn ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(
                    width: 5.sp,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                  )
                ],
              ),
              Container(
                height: 35.sp,
                width: 80.sp,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5.sp)),
                child: Obx(
                  () => Text(
                    controller.point.value.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.listProduct.length,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 70.sp,
                        width: Get.width,
                        margin: EdgeInsets.all(5.sp),
                        child: ItemList(controller.listProduct.value[index]));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemList extends GetView<DiscountController> {
  Product product;

  ItemList(this.product);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        AppImageWidget.network(
          path: product.image,
          height: 50.sp,
        ),
        SizedBox(
          width: 10.sp,
        ),
        Text(
          'Đổi 1 ${product.name}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Container(
          color: Colors.green,
          child: TextButton(
            onPressed: () async {
              String message;
              message = await PostAPI.postChangePoint(product);
              Get.find<AppControleer>().currentUser =await GetApi.getCurrentUser( Get.find<AppControleer>().accessToken.accessToken);
              controller.updatePoint();

              if (!Get.isRegistered<CartController>()) {
                Get.put(CartController());
              }
              product.price = 0.toString();
              Get.find<CartController>().listItem2.value =
                  await GetApi.getAllCart();
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message)));
            },
            child: Text(
              product.point.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
