

import 'GroupModel.dart';
import 'PostModel.dart';

class UserModel {
  UserModel({
    this.uid,
    this.email,
    this.lat,
    this.lng
});

  String uid;
  String email;
  double lat;
  double lng;
  List<PostModel> posts = [];
  List<GroupModel> groups = [];

}