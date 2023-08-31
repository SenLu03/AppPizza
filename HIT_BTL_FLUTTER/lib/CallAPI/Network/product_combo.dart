
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Data/Product.dart';


class NetworkRequestProduct {
  static const String baseAPI='http://207.148.118.106:8080/';
 // static const String urlpizza='http://207.148.118.106:8080/combo/products?comboId=11&categoryId=2';
 // static const sl="http://207.148.118.106:8080/product?id=0&categoryId=3&cakeBase=string&cakeSize=string&cakeSizeId=0";
  static List<Product> parse(String responseBody) {
    var list = json.decode(responseBody)["data"] as List<dynamic>;
    List<Product> menu= list.map((model) => Product.fromJson(model)).toList();
    return menu;
  }

  static Future<List<Product>> fetchProduct(int id) async {
    //String url = '${baseAPI}combo/products?comboId=$id1&categoryId=$id2';
   String url="${baseAPI}product?id=0&categoryId=$id&cakeBase=string&cakeSize=string&cakeSizeId=0";
    try {
      final header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      final res = await http.get(Uri.parse(url), headers: header);
      final response = jsonDecode(utf8.decode(res.bodyBytes))["data"];

      
      if (res.statusCode == 200) {
        
        return List.from(response.map((e) => Product.fromJson(e)));
      } else if (res.statusCode == 404) {
        throw Exception("Not Found");
      } else {
        throw Exception("Can\t get post");
      }
    } catch (e) {
      throw Exception("Error:$e");
    }
  }
}
