import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart';

class Storage {

  Future<void> uploadFile({String filePath,String time}) async {
    File file = File(filePath);
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref(time)
          .putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future<String> downloadURLExample({String filePath,String time}) async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref(time)
        .getDownloadURL();
    return downloadURL;
  }

}