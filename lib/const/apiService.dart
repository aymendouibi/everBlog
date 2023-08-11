import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../model/blog.dart';
import 'const.dart';

class ApiService {
  

  Future<List<dynamic>> getBlogs() async {
    final response = await http.get(Uri.parse('$baseUrl/api/blogs'));
    
    if (response.statusCode == 200) {
      // Parse the response data and return a list of Blog objects
      // using the Blog model you created
      // For example:
       final jsonData = json.decode(response.body);
       blogs = jsonData.map((data) => Blog.fromJson(data)).toList();
      
       return blogs;
    } else {
      throw Exception('Failed to load blogs');
    }
  }

    void saveBlogToLocalStorage(Blog blog) {
    final getStorage = GetStorage();

    // Convert the Blog object to a Map<String, dynamic> to store in GetStorage
    Map<String, dynamic> blogJson = blog.toJson();

    // Save the blog data to GetStorage with a unique key (using the blog's ID)
    getStorage.write('blog_${blog.id}', blogJson);
  }

    List<Blog> getSavedBlogsFromLocalStorage() {
    final getStorage = GetStorage();

    List<Blog> savedBlogs = [];
    final keys = getStorage.getKeys();

    for (var key in keys) {
      if (key.startsWith('blog_')) {
        Map<String, dynamic> blogJson = getStorage.read(key);
        Blog blog = Blog.fromJson(blogJson);
        savedBlogs.add(blog);
      }
    }
    print(savedBlogs);

    return savedBlogs;
  }


Future<void> postBlog(String title, String content, String image, List<String> category) async {
    const url = '$baseUrl/api/blogs'; // Replace with your API endpoint
var token = GetStorage().read('token');
    final headers = {
      'accept':'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // Send the token you received during login
    };

    final body = {
      'title': title,
      'content': content,
      'image': image,
      'category': category,
    };

    final response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));

    if (response.statusCode == 201) {
      print('Blog posted successfully');
    } else {
      print('Failed to post blog');
      print(response.statusCode);
    }
  }


}
