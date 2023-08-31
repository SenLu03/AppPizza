import 'package:btl_flutter/call_API/get_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Data/product_detal.dart';

class SeeOrderController extends GetxController{
  late BuildContext context;
  RxInt totalPrice=00.obs;
  RxList listItem2= <ApiResponse>[].obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    listItem2.value=await GetApi.getOrder();
  }
}