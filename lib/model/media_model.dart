import 'dart:io';

class Media {
  final String? id; // Add this field
  final String? type;
  final File? file;
  final String? url;

  Media({this.id, this.type, this.file, this.url});

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'url': url,
    };
  }
}
