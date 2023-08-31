import 'dart:convert';

import '../Data/User.dart';
import 'package:http/http.dart' as http;

import '../controller/AppControler.dart';
import 'package:get/get.dart';

class PutApi {
  static Future<String> updateAccount(User user) async {
    const apiUrl =
        'http://207.148.118.106:8080/api/v1'; // Địa chỉ API cập nhật tài khoản

    final response = await http.put(
      Uri.parse(apiUrl),
      headers: {
        'Authorization':
            'Bearer ${Get.find<AppControleer>().accessToken.accessToken}',
        'Content-Type': 'application/json',
        // Thêm các header khác nếu cần thiết
      },
      body: json.encode({
        'fullName': user.fullName,
        'username': user.userName,
        'password': user.password,
        'phoneNumber': user.phoneNumber,
        'email': user.email,
        'gender': user.gender,
        'address': user.address,
        'birthday': user.birthday,
      }),
    );

    if (response.statusCode == 200) {
      // Xử lý phản hồi thành công từ API
      return 'Thay đổi thành công';
    } else {
      // Xử lý lỗi từ API
     return 'Hệ thống đang lỗi, thử lại sau';
    }
  }
}
