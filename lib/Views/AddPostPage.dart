import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ronaklesson/Models/PostModel.dart';
import 'package:ronaklesson/Sevices/Storage.dart';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {

  //Variables
  String _imagePath;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  //Functions
  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final PickedFile response = await _picker.getImage(source: ImageSource.gallery);
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
              ),
              SizedBox(height: 16.h,),
              TextField(
                controller: _titleController,
                style: TextStyle(color: Colors.black87, fontSize: 18.sp),
                decoration: InputDecoration(
                  hintText: "enter your post title",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54)),
                ),
              ),
              SizedBox(height: 16.h,),
              TextField(
                controller: _contentController,
                maxLines: null,
                minLines: 4,
                style: TextStyle(color: Colors.black87, fontSize: 18.sp),
                decoration: InputDecoration(
                  hintText: "enter your post content",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54)),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //TODO
          String _timeNow = DateTime.now().toString();

          await Storage().uploadFile(filePath: _imagePath,time: _timeNow);
          String imageURL = await Storage().downloadURLExample(filePath: _imagePath,time: _timeNow);
          await PostModel(title: _titleController.text,content: _contentController.text,imageURL: imageURL).addPost();
          Navigator.pop(context);
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.done),
      ),
    );
  }
}
