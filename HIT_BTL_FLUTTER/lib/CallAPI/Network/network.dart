import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/bogo.dart';


class NetworkRequest {
  static const String url = 'http://207.148.118.106:8080/combo/category/';
  static const String urlnewcb = 'http://207.148.118.106:8080/combo/category/10';
  static const String urlmybox = 'http://207.148.118.106:8080/combo/category/9';
//  static const String url = 'http://207.148.118.106:8080/combo/category/8';
  static const String urlkids = 'http://207.148.118.106:8080/combo/category/7';
  static const String urlvihe = 'http://207.148.118.106:8080/combo/category/6';
  static const String urlsubpizza='http://207.148.118.106:8080/combo/products?comboId=11&categoryId=2';
  static List<BOGO> parseBgo(String responseBody) {
    var list = json.decode(responseBody)["data"] as List<dynamic>;
    List<BOGO> bogo= list.map((model) => BOGO.fromJson(model)).toList();
    return bogo;
  }

  static Future<List<BOGO>> fetchBogo(int id) async {
    String linkAPI=url+id.toString();
    try {
      final header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      final res = await http.get(Uri.parse(linkAPI), headers: header);
      final response = jsonDecode(utf8.decode(res.bodyBytes))["data"];

      print("hehi${res.statusCode}");
      
      if (res.statusCode == 200) {
        
        return List.from(response.map((e) => BOGO.fromJson(e)));
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
