import 'package:everblog/const/const.dart';
import 'package:everblog/const/drawer.dart';
import 'package:everblog/controller/authController.dart';
import 'package:everblog/controller/homeController.dart';
import 'package:everblog/view/details.dart';
import 'package:everblog/view/latest.dart';
import 'package:everblog/view/search.dart';
import 'package:everblog/view/topic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    AuthController authController = Get.find();

    return Scaffold(
      drawer:   const Drawer(
        
        child:  MyDrawer()
    ),
      
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Builder(builder: (context) {
            return IconButton(
              icon: Image.asset(
                'assets/drawer.png',
                fit: BoxFit.fitHeight,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          }),
        ),
       
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(13.0),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 109, 109, 109)
                        .withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child:  Center(
                child: TextField(
                  onSubmitted: (value){
                     
                    homeController.searchBlogs(value).whenComplete(() => Get.to(  MySearch(search: homeController.searchResults)))
                    
                    ;},
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    hintText: 'Search Blogs',
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10),
              child: Text(
                "Topics",
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.titleLarge),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: blogCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  var blogCategory = blogCategories[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 9.0),
                    child: InkWell(
                      onTap: (){
                        Get.to(MyTopic(topic: blogCategory));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: primaryColor,
                          ),
                          height: 20,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Center(
                              child: Text(
                            blogCategory,
                            style: const TextStyle(color: Colors.white),
                          ))),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10,top: 25),
              child: Row(
                children: [
                  Text(
                    "Latest",
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.titleLarge),
                        
                  ),
                  const Spacer(),
                  TextButton(onPressed: (){
                    Get.to(const MyLatest());
                  }, child: Text(
                    "View All",
                    style: GoogleFonts.lato(
                      
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        color: primaryColor
                        
                        ),
                        
                  ),)
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: blogs.length,
                itemBuilder: (BuildContext context, int index) {
                  var blog = blogs[index];
                  return InkWell(
                    onTap: (){
                      Get.to( MyDetails(blog: blog,));
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            placeholder: (context, url) =>
                                Image.asset('assets/placeholder.png'),
                            imageUrl: blog.image,
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(blog.title,
                                style: Theme.of(context).textTheme.titleMedium),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
