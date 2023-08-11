import 'dart:convert';

import 'package:everblog/model/user.dart';
import 'package:everblog/view/home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../const/const.dart';
import 'package:get_storage/get_storage.dart';
// Import your User model

class AuthController extends GetxController {
// Use Rx for reactive updates

  RxString token = ''.obs;
var currentUser=Rx<User?>(null);
  Future<void> login(String email, String password) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/api/login'), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = json.decode(response.body);
        
        token.value=jsonData['token'];
        
        currentUser.value = User.fromJson(jsonData['user']);
        
        GetStorage().write('token', token.value);
      
        Get.offAll(const MyHome());
       

      

        
       
      } else {
        print(response.statusCode);

      }
    } catch (error) {
      print(error);
     
      
    }
  }

  Future<void> register(String name, String email, String password) async {
    try {
      final response =
          await http.post(Uri.parse('$baseUrl/api/register'), body: {
        'name': name,
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = json.decode(response.body);
      token.value=jsonData['token'];
        
        currentUser.value = User.fromJson(jsonData['user']);
        GetStorage().write('token', token.value);
        
        Get.offAll(const MyHome());
       
      } else {
        
        print(response.statusCode.toString());
      }
    } catch (error) {
      // Handle error cases
      
      print(error);
    }
  }

  Future<void> logout() async {
   GetStorage().remove('token');
  
   currentUser.value=null;
   token.value='';
   Get.offAll(const MyHome());
  }
}
