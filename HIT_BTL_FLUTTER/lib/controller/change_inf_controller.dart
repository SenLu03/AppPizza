import 'package:btl_flutter/call_API/put_api.dart';
import 'package:btl_flutter/controller/AppControler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeInfController extends GetxController{
  late BuildContext context;
  final formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController passWordcontroller = TextEditingController();
  final TextEditingController confirmPassWordController =
  TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  RxString gennerValue = "Khác".obs;
  RxBool isVisible = false.obs;
  RxBool isVisibleConfirm = false.obs;
  RxBool isSuccess = false.obs;

  RxBool isLoading = false.obs;

  String message='';
  @override
  void onInit() {
    // TODO: implement onInit
    name.text=Get.find<AppControleer>().currentUser.fullName;
    dateController.text=Get.find<AppControleer>().currentUser.birthday.substring(0,10);
    phoneNumber.text= Get.find<AppControleer>().currentUser.phoneNumber!;
    addressController.text =Get.find<AppControleer>().currentUser.address;
    emailController.text= Get.find<AppControleer>().currentUser.email!;
    super.onInit();
  }
  void onPressChange() async {
    Get.find<AppControleer>().currentUser.fullName=name.text;
    Get.find<AppControleer>().currentUser.birthday=dateController.text;
    Get.find<AppControleer>().currentUser.gender=gennerValue.value;
    Get.find<AppControleer>().currentUser.phoneNumber=phoneNumber.text;
    Get.find<AppControleer>().currentUser.address=addressController.text;
    Get.find<AppControleer>().currentUser.email=emailController.text;

    isLoading.value = true;
    Future.delayed(Duration(seconds: 3), () {
      // Sau khi chờ xong,
      // Đồng thời, tắt trạng thái "loading"
      isLoading.value = false;
    });

    message=await PutApi.updateAccount( Get.find<AppControleer>().currentUser);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message,)));
  }
}