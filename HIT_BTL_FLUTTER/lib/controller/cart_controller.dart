import 'package:btl_flutter/CallAPI/Model/bogo.dart';
import 'package:btl_flutter/Data/Product.dart';
import 'package:btl_flutter/Data/product_detal.dart';
import 'package:btl_flutter/call_API/delele_api.dart';
import 'package:btl_flutter/call_API/get_api.dart';
import 'package:btl_flutter/call_API/post_api.dart';
import 'package:btl_flutter/controller/AppControler.dart';
import 'package:btl_flutter/controller/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CartController extends GetxController{
  late BuildContext context;
  RxList<BOGO> listItem=<BOGO>[].obs;
  RxInt totalPrice=00.obs;
  RxList listItem2= <ProductDetail>[].obs;
  RxString typeShip='Giao hàng tận nơi'.obs;///true ship, false no ship

  String messeger='';
  @override
  void onInit() async {
    // TODO: implement onInit
    //typeShip.text='Giao hàng tận nơi';
    listItem2.value=await GetApi.getAllCart();
   cacuTotalPrice();
  }
  @override
  void onReady() async {
    // TODO: implement onReady
    listItem2.value=await GetApi.getAllCart();
    cacuTotalPrice();
    super.onReady();
  }
  void onPressOder()async {
    messeger=await PostAPI.postCart(Get.find<AppControleer>().address);
    listItem2.value=await GetApi.getAllCart();
    if(listItem2.isEmpty){
      messeger='Đặt hàng thành công';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(messeger)));
      Get.back();
    }
    cacuTotalPrice();
  }
  void onPressDelele(int id) async {
    messeger=await DeleteApi.deleteProductDetail(id);
    listItem2.value=await GetApi.getAllCart();
    cacuTotalPrice();
  }
  void clearCart() async {


    Get.find<AppControleer>().currentUser.point += totalPrice.value ~/ 10000;

    if(!Get.isRegistered<MapController>()){
      Get.put(MapController());
    }
    String location=Get.find<MapController>().address.value;
    messeger =await PostAPI.postCart(location);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text( messeger)));
    if(messeger.compareTo('Đặt hàng thành công')==0)
      {
        listItem.clear();
        listItem2.clear();
        totalPrice.value=0;
      }
    print( Get.find<AppControleer>().currentUser.point);

  }
  void cacuTotalPrice() {


    totalPrice.value=0;

    for(var i in listItem2.value){
      int value=i.price*i.quatity;
      totalPrice.value+=value;
    }
  }
}