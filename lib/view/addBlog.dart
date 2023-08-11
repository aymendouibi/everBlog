import 'dart:io';

import 'package:everblog/const/const.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiselect/multiselect.dart';
import '../const/apiService.dart';
class AddBlogPage extends StatefulWidget {
  const AddBlogPage({super.key});

  @override
  _AddBlogPageState createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  final ApiService apiService = ApiService();

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  XFile? selectedImage;
  List<String> selectedCategories = []; // Store the selected category IDs

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Blog')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Title')),
            const SizedBox(height: 16.0),
            TextField(controller: contentController, decoration: const InputDecoration(labelText: 'Content')),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Image'),
            ),
            if (selectedImage != null) ...[
              Image.file(File(selectedImage!.path),height: 100,width: 100,),
              
              
             
            ],
             const SizedBox(height: 16.0),
              DropDownMultiSelect(
             options: blogCategories,
		  selectedValues: selectedCategories,
		  onChanged: (value) {
                setState(() {
                  selectedCategories = value;
                });
             
              },
            ),
              ElevatedButton(
                onPressed: () async {
                
                  final title = titleController.text;
                  final content = contentController.text;
              

                  await apiService.postBlog(title, content,'gred',selectedCategories);

                  
                },
                child: const Text('Add Blog'),
              ),
          ],
        ),
      ),
    );
  }
}
