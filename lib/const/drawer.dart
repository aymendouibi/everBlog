import 'package:everblog/view/addBlog.dart';
import 'package:everblog/view/auth.dart/login.dart';
import 'package:everblog/view/auth.dart/register.dart';
import 'package:everblog/view/saved.dart';
import 'package:flutter/material.dart';

import '../controller/authController.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_storage/get_storage.dart';


class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
 
 
}

class _MyDrawerState extends State<MyDrawer> {
  AuthController authController = Get.find();
  
  

  @override
  Widget build(BuildContext context) {
  
    
    
  
    return GetStorage().read('token') == null || GetStorage().read('token')=='' 
        ? Column(
            children: [
               const SizedBox(
                height: 50,
              ),
              ListTile(
                      leading: const Icon(
                        Icons.download,
                      ),
                      title: const Text('Saved blogs'),
                      onTap: () {
                        Get.to(MySaved());
                      },
                    ),
             const Spacer(),
               Text("Start uploading your blogs", style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.titleMedium),),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.to(MyLogin());
                      },
                      child: const Text('Login')),
                       ElevatedButton(
                  onPressed: () {
                    Get.to(MyRegister());
                  },
                  child: const Text('Register')),
                ],
              ),
                  

                  const SizedBox(
                height: 50,
              ),
            ],
          )
        : Column(
            children: [
              Expanded(
                child: ListView(
                  // Important: Remove any padding from the ListView.

                  children: [
                    
                    
                    ListTile(
                      leading: const Icon(
                        Icons.download,
                      ),
                      title: const Text('Saved blogs'),
                      onTap: () {
                        Get.to(MySaved());
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.add,
                      ),
                      title: const Text('Create New blog'),
                      onTap: () {
Get.to(const AddBlogPage());
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ListTile(
                tileColor: Colors.red,
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: const Icon(
                  Icons.arrow_back,
                ),
                title: const Text('Logout'),
                onTap: () {
                  authController.logout();
                },
              ),
            ],
          );
  }
}
