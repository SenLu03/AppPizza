
import 'package:get/get.dart';

import '../Data/User.dart';
import '../Data/Userlogin.dart';

class AppControleer extends SuperController{

  User currentUser=User(fullName: 'fullName', userName: 'userName', password: 'password', gender: 'nam', address: 'address', birthday: 'birthday', point: 100);
  AccessToken accessToken=new AccessToken(tokenType: '', accessToken: '', refreshToken: '', id: '', authorities:[]);
  String address='';
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}