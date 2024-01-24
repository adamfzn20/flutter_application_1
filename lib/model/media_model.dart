import 'dart:io';

class Media {
  final String type;
  final File file; // Add this field for the image or video file

  Media({required this.type, required this.file});
}
