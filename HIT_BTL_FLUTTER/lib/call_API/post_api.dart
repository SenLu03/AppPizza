import 'dart:convert';

import 'package:btl_flutter/call_API/get_api.dart';
import 'package:btl_flutter/controller/AppControler.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Data/Product.dart';
import '../Data/User.dart';
import '../Data/Userlogin.dart';
import '../Data/product_detal.dart';

class PostAPI{
  static String apiBase='http://207.148.118.106:8080/';
  static Future<bool> postLogin(String userName,String password) async {
    String api='${apiBase}api/v1/auth/login';// link api hoan chinh
    final response= await http.post(Uri.parse(api),/// put,get lay du lieu, delele xoa du lieu
        headers: {
          'Content-Type':'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String,String>{
          // key: value
          'username':userName,//
          'password':password,
        })
    );


    if (response.statusCode == 200) {
      final responseData = json.decode(response.body)["data"];
      // print(responseData);
      final accessToken = AccessToken.fromJson(responseData);
      Get.find<AppControleer>().accessToken=accessToken;
      Get.find<AppControleer>().currentUser =await GetApi.getCurrentUser(accessToken.accessToken);
      print(Get.find<AppControleer>().currentUser?.userName);
      return true;

    } else {
      return false;
      // If the server did not return a 200 OK response, throw an exception or handle the error.

    }

  }
  static Future<void> forgotPassword(String username) async {
    String forgotPasswordUrl='${apiBase}api/v1/forgot-password';
    try {
      // Tạo yêu cầu POST gửi thông tin email cần khôi phục mật khẩu
      var response = await http.post(
        Uri.parse(forgotPasswordUrl),
        body: {
          'userName': username,
        },
      );
      var data = json.decode(response.body);
      var password = data['data']['body']['password'];
      print(password);
      // Kiểm tra phản hồi từ máy chủ
      if (response.statusCode == 200) {
        // Xử lý phản hồi thành công từ máy chủ (thông báo, điều hướng...)
        print('Yêu cầu khôi phục mật khẩu thành công!');
      } else {
        // Xử lý phản hồi lỗi từ máy chủ
        print('Yêu cầu khôi phục mật khẩu thất bại: ${response.statusCode}');
      }
    } catch (e) {
      // Xử lý lỗi nếu có
      print('Lỗi khi gọi API: $e');
    }
  }

  static Future<String> registerUser(User user) async {
    final apiUrl = '${apiBase}api/v1/new-user'; // Thay thế bằng URL của API đăng ký

    final userData = {
      "fullName": user.fullName,
      "username": user.userName,
      "password": user.password,
      "phoneNumber": user.phoneNumber,
      "email": user.email,
      "gender": user.gender,
      "address": user.address,
      "birthday": user.birthday,
    };

    final response = await http.post(Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(userData));
    if (response.statusCode == 200) {
      return 'Đăng ký thành công';
      // Xử lý các logic sau khi đăng ký thành công
    } else {
      return 'Đăng ký thất bại. Mã trạng thái: ${jsonDecode(response.body)['message']}';
      // Xử lý các logic sau khi đăng ký thất bại
    }
  }

  static Future<String> postCart(String address) async {
    final apiUrl = '${apiBase}order';
    final response = await http.post(Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer ${Get.find<AppControleer>().accessToken.accessToken}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String,String>{
          // key: value
          'delivery_address':address,//
        })
    );
    if(response.statusCode==200){
      return 'Đặt hàng thành công';
    }
    else{
      return 'Hệ thống đang lỗi, vui lòng thử lại sau';
    }
  }

  static Future<ProductDetail> postProDuctDetal(int productId, int sizeId, int caseBaseId) async {
    String apiUrl='${apiBase}product_detail';

    final reponse=await http.post(Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer ${Get.find<AppControleer>().accessToken.accessToken}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String,int>{
        'productId':productId,
        'sizeId':sizeId,
        'cakeBaseId':caseBaseId,
      })
    );
    print('${reponse.statusCode}');
    if(reponse.statusCode==200){
      final productDetail=ProductDetail.fromJson(jsonDecode(utf8.decode(reponse.body.codeUnits))['data']);
      return productDetail;
    }
    throw Exception('khong the tao detail');
  }

  static Future<ProductDetail> postProDuctCart(ProductDetail productDetail) async {
    String apiUrl='${apiBase}cart/product/${productDetail.id}';

    final reponse=await http.post(Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer ${Get.find<AppControleer>().accessToken.accessToken}',
          'Content-Type': 'application/json',
        },

    );
    if(reponse.statusCode==200){
      final productDetail=ProductDetail.fromJson(jsonDecode(utf8.decode(reponse.body.codeUnits))['data']);
      return productDetail;
    }
    throw Exception('khong the add detail');
  }
  static Future<String> postChangePoint(Product product) async {
    String apiUrl = '${apiBase}product/point/${product.id}';
    final reponse = await http.post(Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer ${Get
            .find<AppControleer>()
            .accessToken
            .accessToken}',
        'Content-Type': 'application/json',
      },
    );
    print(reponse.statusCode);
    if (reponse.statusCode == 200) {
      return 'ĐỔi điểm thành công';
    }
    return 'Đổi điểm không thành công';
  }
  static Future<bool> postToCartCombo(int comboId) async {
    String apiUrl = '${apiBase}cart/combo/${comboId}';
    final reponse = await http.post(Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer ${Get
            .find<AppControleer>()
            .accessToken
            .accessToken}',
        'Content-Type': 'application/json',
      },
    );
    print(reponse.statusCode);
    if (reponse.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<int> postCreateCombo(int comboId,int productDetailId) async {
    final apiUrl = '${apiBase}combo/product';
    final response = await http.post(Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer ${Get.find<AppControleer>().accessToken.accessToken}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String,int>{
          "combo_id": comboId,
          "product_detail_id": productDetailId,
        })
    );
    if(response.statusCode==200){
      return jsonDecode(response.body)["data"]["id"];
    }
    else{
      return 0;
    }
  }
}