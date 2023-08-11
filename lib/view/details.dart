import 'package:everblog/const/apiService.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../model/blog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyDetails extends StatelessWidget {
  Blog blog;
  MyDetails({super.key, required this.blog});
  var apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          apiService.saveBlogToLocalStorage(blog);
        },
        child: const Icon(Icons.download),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(blog.title!, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(DateFormat("yyyy-MM-dd").format(blog.createdAt!),
                  style: Theme.of(context).textTheme.titleSmall),
            ),
            blog.user == null
                ? Container()
                : Align(
                    alignment: Alignment.centerRight,
                    child: Text("Posted by ${blog.user!.name!}",
                        style: Theme.of(context).textTheme.titleSmall)),
            const SizedBox(
              height: 30,
            ),
            CachedNetworkImage(
              placeholder: (context, url) =>
                  Image.asset('assets/placeholder.png'),
              imageUrl: blog.image!,
              height: Get.height * 0.3,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(blog.content!, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
