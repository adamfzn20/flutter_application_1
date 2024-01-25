import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DataStorageProvider extends ChangeNotifier {
  List<String> fileUrls = [];

  Future<void> getStorageList() async {
    fileUrls.clear();
    String folderName = "/${FirebaseAuth.instance.currentUser?.uid}/";
    var storageRef = FirebaseStorage.instance.ref().child(folderName);

    var items = await storageRef.listAll();

    for (var item in items.items) {
      String url = await item.getDownloadURL();
      fileUrls.add(url);
    }

    notifyListeners();
  }
}
