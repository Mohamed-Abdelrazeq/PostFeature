import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/PostModel.dart';


class PostCard extends StatelessWidget {
  const PostCard({this.postModel});

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Column(
        children: [
          Image(
            height: 150.h,
            width: 328.w,
            fit: BoxFit.cover,
            image: NetworkImage(postModel.imageURL),
          ),
          Container(
            width: 328.w,
            padding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            color: Colors.black87,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  postModel.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  postModel.content,
                  style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


