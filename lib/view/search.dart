import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'details.dart';

class MySearch extends StatelessWidget {
  var search;
  MySearch({super.key, this.search});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Results",
          style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleLarge),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: search.length,
          itemBuilder: (BuildContext context, int index) {
            var result = search[index];
            return InkWell(
              onTap: () {
                
                Get.to(
                  MyDetails(
                  blog: result,
                ));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      placeholder: (context, url) =>
                          Image.asset('assets/placeholder.png'),
                      imageUrl: result.image,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(result.title,
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
