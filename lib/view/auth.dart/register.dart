import 'package:everblog/const/textfield.dart';
import 'package:everblog/view/auth.dart/login.dart';
import 'package:flutter/material.dart';

import '../../const/const.dart';
import '../../controller/authController.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class MyRegister extends StatelessWidget {
  MyRegister({super.key});
  TextEditingController email= TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController password=TextEditingController();
   

  @override
  Widget build(BuildContext context) {
     AuthController authController = Get.find();
    return  Scaffold(
      resizeToAvoidBottomInset:false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset('assets/logo.png',height: Get.height*0.2,),
            
            const SizedBox(height: 50,),
            MyTextField(controller: email, hint: 'enter your email'),
            const SizedBox(height: 20,),
            MyTextField(controller: name, hint: 'enter your name'),
            const SizedBox(height: 20,),
            MyTextField(controller: password, hint: 'enter your password',obscure: true,),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Already a User ?", style: GoogleFonts.lato(
                                      textStyle:
                                          Theme.of(context).textTheme.titleMedium),),
                                          TextButton(onPressed: (){
                                            Get.to(MyLogin());
                                          }, child: Text("Login", style: GoogleFonts.lato(
                                      textStyle:
                                          Theme.of(context).textTheme.titleMedium,
                                          color: primaryColor
                                          
                                          ),
                                        
                                          ),)
               ],
             ),
            ElevatedButton(onPressed: (){
              authController.register( name.value.text,email.value.text, password.value.text);
      
            }, child: const Text('Register')),
      
            
          ],
        ),
      ),
    );
  }
}