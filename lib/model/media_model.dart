import 'dart:io';

class Media {
  final String type;
  final File file;
  final String? url;

  Media({required this.type, required this.file, this.url});
}
