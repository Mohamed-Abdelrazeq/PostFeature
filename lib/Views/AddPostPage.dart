import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {

  String _imagePath;

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final PickedFile response = await _picker.getImage(source: ImageSource.gallery);
    print(response.path);
    setState(() {
      _imagePath = response.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.black87,title: Text("Add Post"),),
      body: Container(
        width: 360.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              _imagePath == null ? InkWell(
                onTap: (){
                  _getImage();
                },
                child: Container(
                  width: 328.w,
                  height: 150.h,
                  color: Colors.black87,
                  child: Center(
                    child: Icon(Icons.add,color: Colors.white70,size: 92.r,),
                  ),
                ),
              ) : InkWell(
                onTap: (){
                  _getImage();
                },
                child: Image(
                  width: 328.w,
                  height: 150.h,
                  fit: BoxFit.cover,
                  image: FileImage(File(_imagePath)),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.done),
      ),
    );
  }
}
