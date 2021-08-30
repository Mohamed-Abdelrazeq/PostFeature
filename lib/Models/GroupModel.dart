

import 'PostModel.dart';

class GroupModel {
  GroupModel({
    this.title,
    this.imageURL,
    this.description,
});

  String title;
  String imageURL;
  String description;
  int membersCount = 1;
  List<PostModel> posts = [];
}