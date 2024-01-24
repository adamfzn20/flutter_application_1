import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/media_model.dart';

class MediaProvider extends ChangeNotifier {
  List<Media> mediaItems = [];

  void addMedia(Media media) {
    mediaItems.add(media);
    notifyListeners();
  }

  // Update this method to accept a File
  void addImage(File imageFile) {
    Media imageMedia = Media(type: 'image', file: imageFile);
    addMedia(imageMedia);
  }

  // ... (Other methods)
}
