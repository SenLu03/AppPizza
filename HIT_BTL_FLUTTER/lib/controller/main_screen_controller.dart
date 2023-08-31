import 'package:btl_flutter/CallAPI/Network/product_combo.dart';
import 'package:btl_flutter/Data/Product.dart';
import 'package:btl_flutter/controller/state_main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../AppRouter/AppRouter.dart';
import '../CallAPI/Model/bogo.dart';
import '../CallAPI/Network/network.dart';
class MainScreenController extends GetxController{
  late BuildContext context;
  bool isLoadMap=false;

  RxList getData=<BOGO>[].obs;
  RxList get=<Product>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    getData.value= await NetworkRequest.fetchBogo(6);
    get.value=await NetworkRequestProduct.fetchProduct(2);
    super.onInit();
  }

  onPressSeeMenu(){
    if(!Get.isRegistered<StateMainController>()){
      Get.put(StateMainController());
    }
    Get.find<StateMainController>().selectedIndex.value=1;
  }

  onPressCombo(int index){
    /// chuyen den màn combo dc click
  }
  onPressCallGoogleMap() async {
    ProgressDialog progressDialog = ProgressDialog(context: context);

    Position? currentPosition;
    progressDialog.show(msg: 'Đang lấy vị trí');
    Future.delayed(const Duration(seconds: 2), () async {
      // Sau khi chờ xong, đặt giá trị của statusSendPass thành true
      currentPosition = await getCurrentPosition(context);
      progressDialog.close();
      Get.toNamed(AppRouter.mapScreen,
          arguments: {'myLocation': currentPosition});

    });

  }

  Future<Position> getCurrentPosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // showErrorDialog(context, StringConstants.errorLocation01.tr);
      return Future.error({'code': 1, 'message': 'lõi'});
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // showErrorDialog(context, StringConstants.errorLocation02.tr);
        return Future.error({'code': 2, 'message': 'Loi'});
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error({'code': 2, 'message': 'Loi'});
    }
    return await Geolocator.getCurrentPosition();
  }

}

