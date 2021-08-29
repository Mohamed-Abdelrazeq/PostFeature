import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("News Feed")),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        width: 360.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image(
                    height: 150.h,
                    width: 328.w,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://imgix.bustle.com/rehost/2016/9/13/98c6b94f-014a-467a-80b0-0167b9796329.jpg?w=800&fit=crop&crop=faces&auto=format%2Ccompress"),
                  ),
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    color: Colors.black87,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Post Title",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 14.sp),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, "/AddPostPage");
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          size: 30.r,
          color: Colors.white.withOpacity(.85),
        ),
      ),
    );
  }
}
