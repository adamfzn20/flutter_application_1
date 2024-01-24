import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/media_model.dart';

class MediaProvider extends ChangeNotifier {
  List<Media> mediaItems = [];

  String? getCurrentUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  void addMedia(Media media) {
    mediaItems.add(media);
    notifyListeners();
  }
}

enum MediaType { image, video }
