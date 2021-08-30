import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ronaklesson/Component/PostCard.dart';

import '../Models/PostModel.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final Stream<QuerySnapshot> _postsStream = FirebaseFirestore.instance.collection('posts').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("News Feed")),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: 360.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: StreamBuilder<QuerySnapshot>(
                stream: _postsStream,
                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  return Column(
                    children: snapshot.data.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data();
                      return PostCard(postModel: PostModel().toObject(postModelMap: data));
                    }).toList(),
                  );
                },
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



