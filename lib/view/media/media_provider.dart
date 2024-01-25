import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/media_model.dart';

class MediaProvider extends ChangeNotifier {
  // Firestore collection
  List<Media> mediaItems = [];

  String? getCurrentUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  CollectionReference get mediaCollection {
    return FirebaseFirestore.instance.collection('media');
  }

  Future<void> addMedia(Media media) async {
    try {
      String? userId = getCurrentUserId();
      if (userId != null) {
        DocumentReference documentReference = await mediaCollection
            .doc(userId) // Use user's ID as part of the document path
            .collection('userMedia')
            .add(media.toMap());

        String mediaId = documentReference.id;
        mediaItems.add(Media(
            id: mediaId, type: media.type, file: media.file, url: media.url));
        notifyListeners();
      } else {
        print('User not authenticated');
      }
    } catch (error) {
      print('Failed to add media to Firestore: $error');
    }
  }
}

enum MediaType { image, video }
