import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/media/media_provider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class MediaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaProvider = Provider.of<MediaProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Media')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final picker = ImagePicker();
              final XFile? pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);

              if (pickedFile != null) {
                // Handle the picked image file
                File imageFile = File(pickedFile.path);
                // Call the method to add the image to the provider
                Provider.of<MediaProvider>(context, listen: false)
                    .addImage(imageFile);
              }
            },
            child: Text('Upload Image'),
          ),
          ElevatedButton(
            onPressed: () async {
              // Open the video picker
              final picker = ImagePicker();
              final pickedFile =
                  await picker.pickVideo(source: ImageSource.gallery);

              if (pickedFile != null) {}
            },
            child: Text('Upload Video'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mediaProvider.mediaItems.length,
              itemBuilder: (context, index) {
                var media = mediaProvider.mediaItems[index];
                return ListTile(
                  title: Text('Media ${index + 1}'),
                  subtitle: Text(media.type),
                  leading: media.type == 'image'
                      ? Image.file(media.file,
                          height: 50, width: 50, fit: BoxFit.cover)
                      : Icon(Icons.videocam),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
