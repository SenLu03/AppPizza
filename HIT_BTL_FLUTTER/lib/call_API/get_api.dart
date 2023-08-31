import 'dart:convert';

import 'package:btl_flutter/Data/product_detal.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Data/Product.dart';
import '../Data/User.dart';
import '../controller/AppControler.dart';

class GetApi {
  static String api = 'http://207.148.118.106:8080/';

  static Future<User> getCurrentUser(String token) async {
    final url = '${api}api/v1/user/current'; // Replace with your API endpoint
    // Add any required headers (e.g., authorization token) to the request headers
    Map<String, String> headers = {
      'Authorization': 'Bearer $token', // Replace with your access token
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        // API call successful, parse the JSON response and create a User object
        Map<String, dynamic> jsonData = json.decode(response.body)["data"];
        print(jsonData);

        return User.fromJson(jsonData);
      } else {
        // API call failed, handle the error accordingly
        print('Error: ${response.statusCode}');
        throw Exception(
            'Failed to load data'); // Return null or handle the error case depending on your use case
      }
    } catch (e) {
      // Error occurred during API call
      print('Error: $e');
      throw Exception(
          'Failed to load data'); // Return null or handle the error case depending on your use case
    }
  }

  static Future<List<Product>> getProducts() async {
    Map<String, String> headers = {
      'Authorization':
      'Bearer ${Get
          .find<AppControleer>()
          .accessToken
          .accessToken}', // Replace with your access token
      'Content-Type': 'application/json',
    };
    final response =
    await http.get(Uri.parse('${api}product/point'), headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData =
      json.decode(utf8.decode(response.body.codeUnits))["data"];
      final List<Product> products =
      jsonData.map((item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<ProductDetail>> getAllCart() async {
    final response = await http.get(
      Uri.parse('${api}cart'),
      headers: {
        'Authorization':
        'Bearer ${Get
            .find<AppControleer>()
            .accessToken
            .accessToken}',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonData1 =
      json.decode(utf8.decode(response.body.codeUnits))["data"]
      ["productDetailResponseDTOS"];
      final List<ProductDetail> products =
      jsonData1.map((item) => ProductDetail.fromJson(item)).toList();
      print('cart $products');
      final List<dynamic> jsonData =
      json.decode(utf8.decode(response.body.codeUnits))["data"]
      ["comboCartDTOS"];
      products.addAll(jsonData.map((item) => ProductDetail.fromJson(item)).toList());
      return products;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<ApiResponse>> getOrder() async {
    String apiUrl = 'http://207.148.118.106:8080/order';

    final response = await http.get(Uri.parse(apiUrl), headers: {
      'Authorization': 'Bearer ${Get.find<AppControleer>().accessToken.accessToken}',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      String jsonData = utf8.decode(response.bodyBytes);
      Map<String, dynamic> jsonResponse = json.decode(jsonData);

      List<ApiResponse> apiResponses = List<ApiResponse>.from(jsonResponse['data'].map((x) => ApiResponse.fromJson(x)));

      List<CartResponseDTO> cartResponseDTOs = apiResponses
          .map((apiResponse) => apiResponse.cartResponseDTO)
          .toList();

      return apiResponses;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
class ApiResponse {
  CartResponseDTO cartResponseDTO;
  int totalMoney;

  ApiResponse({required this.cartResponseDTO, required this.totalMoney});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      cartResponseDTO: CartResponseDTO.fromJson(json['cartResponseDTO']),
      totalMoney: json['totalMoney'],
    );
  }
}

class CartResponseDTO {
  List<Map<String, dynamic>> productDetailResponseDTOS;
  List<dynamic> comboCartDTOS;

  CartResponseDTO({required this.productDetailResponseDTOS, required this.comboCartDTOS});

  factory CartResponseDTO.fromJson(Map<String, dynamic> json) {
    return CartResponseDTO(
      productDetailResponseDTOS: List<Map<String, dynamic>>.from(json['productDetailResponseDTOS']),
      comboCartDTOS: List<dynamic>.from(json['comboCartDTOS'].map((x) => x)),
    );
  }
}