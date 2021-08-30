import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupsPage extends StatefulWidget {

  @override
  _GroupsPageState createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Groups")),backgroundColor: Colors.black,),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 50,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 16.h,right: 16.w,left: 16.w),
              width: 328.w,
              height: 250.h,
              decoration: BoxDecoration(
                color: Colors.black87
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150.r,
                    height: 150.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Text(
                    "Group $index",
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                      fontSize: 22.sp
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // TODO : Add New Group
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
