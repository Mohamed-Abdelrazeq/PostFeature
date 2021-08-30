import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  PostModel({
    this.title,
    this.content,
    this.imageURL,
});

  String title;
  String content;
  String imageURL;

  CollectionReference _posts = FirebaseFirestore.instance.collection('posts');

  Future<void> addPost() async {
    _posts
        .add({
      'title': title,
      'content': content,
      'imageURL': imageURL
    })
        .then((value) => print("Post Added"))
        .catchError((error) => print("Failed to add post: $error"));
  }

  PostModel toObject({Map postModelMap}){
    return PostModel(title: postModelMap['title'],content: postModelMap['content'],imageURL: postModelMap['imageURL']);
  }

  Map toMap(){
    return {'title':title,'content':content,'imageURL':imageURL};
  }

}