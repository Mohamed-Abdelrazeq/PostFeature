import 'package:flutter/material.dart';

class PostModel {
  PostModel({
    this.title,
    this.content,
    this.imageURL,
});

  String title;
  String content;
  String imageURL;

  PostModel toObject({Map postModelMap}){
    return PostModel(title: postModelMap['title'],content: postModelMap['content'],imageURL: postModelMap['imageURL']);
  }

  Map toMap(){
    return {'title':title,'content':content,'imageURL':imageURL};
  }

}