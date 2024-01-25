import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/media_model.dart';
import 'package:flutter_application_1/view/media/media_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class MediaPage extends StatefulWidget {
  const MediaPage({super.key});

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  late MediaProvider mediaProvider;

  @override
  void initState() {
    super.initState();
    mediaProvider = Provider.of<MediaProvider>(context, listen: false);
    mediaProvider.getStorageList();
  }

  @override
  Widget build(BuildContext context) {
    var mediaProvider = Provider.of<MediaProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Media')),
      body: ListView.builder(
        itemCount: mediaProvider.fileUrls.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  mediaProvider.fileUrls[index],
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    mediaProvider.fileUrls[index],
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _pickAndUploadMedia(context, MediaType.image);
        },
        child: const Icon(Icons.upload_file),
      ),
    );
  }

  Future<void> _pickAndUploadMedia(
      BuildContext context, MediaType mediaType) async {
    final picker = ImagePicker();
    final source = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Take a Photo'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        );
      },
    );

    if (source == null) return;

    XFile? pickedFile;
    if (source == ImageSource.camera) {
      pickedFile = await picker.pickImage(source: source);
    } else {
      pickedFile = await picker.pickVideo(source: source);
    }

    if (pickedFile != null) {
      File mediaFile = File(pickedFile.path);
      if (context.mounted) {
        await _uploadMedia(context, mediaFile, mediaType);
      }
    }
  }

  Future<void> _uploadMedia(
      BuildContext context, File mediaFile, MediaType mediaType) async {
    try {
      final userId =
          Provider.of<MediaProvider>(context, listen: false).getCurrentUserId();
      if (userId == null) {
        print('User not authenticated');
        return;
      }

      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageReference = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('$userId/$fileName');

      storageReference.putFile(mediaFile);

      // await uploadTask.whenComplete(() async {
      //   final downloadURL = await storageReference.getDownloadURL();
      //   Media media = Media(
      //       type: mediaType.toString(), file: mediaFile, url: downloadURL);
      //   if (context.mounted) {
      //     Provider.of<MediaProvider>(context, listen: false).addMedia(media);
      //   }
      // });

      print('Media uploaded successfully');
    } catch (error) {
      print('Failed to upload media: $error');
    }
  }
}
