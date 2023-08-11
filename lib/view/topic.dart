import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../const/const.dart';
import 'details.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTopic extends StatelessWidget {
  String topic;
  MyTopic({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          topic,
          style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleLarge),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: blogs.length,
          itemBuilder: (BuildContext context, int index) {
            var blog = blogs[index];
            
            return blog.category.every((element) => element.toString().toUpperCase()==topic.toUpperCase()) /*element.toUpperCase()==topic.toUpperCase()? true:false)*/
                ? InkWell(
                    onTap: () {
                      Get.to(MyDetails(
                        blog: blog,
                      ));
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
                  )
                : const SizedBox();
          },
        ),
      ),
    );
  }
}
