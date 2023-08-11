import 'dart:convert';

import 'package:get/get.dart';
import '../const/const.dart';
import '../model/blog.dart';
import 'package:http/http.dart' as http;
class HomeController extends GetxController{
  
 var searchResults;
RxBool loading=false.obs;


  Future<void> searchBlogs(String keywords) async {
    
    loading=true.obs;
    update();
    if(keywords==''){
      Get.snackbar('enter desired search', 'can not be empty');
      loading=false.obs;
    update();
    }
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/blogs/search?keywords=$keywords'));
      if (response.statusCode == 200 ) {
         final jsonData = json.decode(response.body);
       searchResults= jsonData.map((data) => Blog.fromJson(data)).toList();
      print(searchResults);
    loading=false.obs;
    update();
      } else {
        Get.snackbar('Something went Wrong', 'try again');
        loading=false.obs;
    update();
      }
    } catch (error) {
      Get.snackbar("Error",error.toString());
      loading=false.obs;
    update();
    }
    loading=false.obs;
    update();
  }  
}