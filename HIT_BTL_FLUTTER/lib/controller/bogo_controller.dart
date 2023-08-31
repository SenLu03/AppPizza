import 'package:get/get.dart';

import '../CallAPI/Model/bogo.dart';
import '../CallAPI/Network/network.dart';
class BogoController extends GetxController{
  RxList getData = <BOGO>[].obs;

  @override
  void onInit() async{
    // TOD O: implement onInit
   getData.value=await NetworkRequest.fetchBogo(8);
    super.onInit();
  }
}