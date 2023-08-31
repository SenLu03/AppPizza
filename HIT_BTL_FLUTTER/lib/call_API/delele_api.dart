import '../controller/AppControler.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class DeleteApi{
  static String api = 'http://207.148.118.106:8080/';

  static Future<String> deleteProductDetail(int id) async{
    String apiUrl='${api}cart/product/$id';

    final response=await http.delete(Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer ${Get.find<AppControleer>().accessToken.accessToken}',
        'Content-Type': 'application/json',
      },
    );
    if(response.statusCode==0){
      return 'Xóa thành công';
    }
    return 'Lỗi';
  }
}