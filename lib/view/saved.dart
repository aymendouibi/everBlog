import 'package:everblog/const/apiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
class MySaved extends StatefulWidget {
   MySaved({super.key});
var api = ApiService();
var savedBlog;
  @override
  State<MySaved> createState() => _MySavedState();

  
}

class _MySavedState extends State<MySaved> {
  @override
void initState() {
  super.initState();
 widget.savedBlog= widget.api.getSavedBlogsFromLocalStorage();
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar:AppBar(
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        title:  Text(
                    "Latest",
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.titleLarge),
                        
                  ),
      ),
body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.savedBlog.length,
          itemBuilder: (BuildContext context, int index) {
            var blog = widget.savedBlog[index];
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
    );
  }
}