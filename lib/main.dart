import 'package:everblog/const/const.dart';

import 'package:everblog/controller/authController.dart';
import 'package:everblog/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'const/apiService.dart';
import 'controller/homeController.dart';

void main() async{
  await GetStorage.init();
  var apiservice= ApiService();

  final response = await apiservice.getBlogs();
  runApp( const MyApp());
}
class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(AuthController());

    
  }
}
class MyApp extends StatelessWidget {
  
   const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     initialRoute: "/",
     initialBinding: BaseBindings(),
  getPages: [
    GetPage(name: "/", page: () => const MyHome(), binding: BaseBindings()), // here!
  ],
      debugShowCheckedModeBanner: false,
      title: 'EverBlog',
      theme: ThemeData(
       textTheme: textTheme,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const MyHome(),
    );
  }
}
