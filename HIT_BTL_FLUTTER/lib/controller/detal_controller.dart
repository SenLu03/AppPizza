import 'package:btl_flutter/Data/product_detal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CallAPI/Model/bogo.dart';
import '../CallAPI/Network/pizza_network.dart';
import '../Data/Combo.dart';
import '../Data/Product.dart';
import '../UI/dialog/select.dart';
import '../call_API/get_api.dart';
import '../call_API/post_api.dart';
import 'cart_controller.dart';

class DetalController extends GetxController {
  late BuildContext context;
  late Combo bogoItem;
  TextEditingController textAppertizer = TextEditingController();
  TextEditingController textDrink = TextEditingController();

  RxList getDataAppetizer = <Product>[].obs;
  RxList getDataDrink = <Product>[].obs;

  static int comboId=10;

  @override
  void onInit() async {
    // TODO: implement onInit

    bogoItem = Get.arguments['bogoItem'];

    getDataAppetizer.value= await NetworkRequestSubMenu.fetchSub(6, 5);


    getDataDrink.value= await NetworkRequestSubMenu.fetchSub(7, 4);

    super.onInit();
  }
  void onPressAdd() async {
    if(!Get.isRegistered<CartController>()){
      Get.put(CartController());
    }

    bogoItem.product.name=Select.displayText;
    bogoItem.appertizer=textAppertizer.text;
    bogoItem.drink=textDrink.text;

    ProductDetail pizza=await PostAPI.postProDuctDetal(bogoItem.pizzaId!, 1, 1);
    PostAPI.postCreateCombo(comboId, pizza.id);

    ProductDetail appertizer=await PostAPI.postProDuctDetal(bogoItem.appertizerId!, 1, 1);
    PostAPI.postCreateCombo(comboId, appertizer.id);

    ProductDetail drink = await PostAPI.postProDuctDetal(bogoItem.drinkId!, 1, 1);
    int idAddCart=await PostAPI.postCreateCombo(bogoItem.product.id!,drink.id);

    bool status = await PostAPI.postToCartCombo(idAddCart);

    if(status){
      comboId++;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Them thanh cong')));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Thu lai sau')));
    }
    Get.find<CartController>().listItem2.value =
    await GetApi.getAllCart();
  }
}
