import 'package:cloud_firestore/cloud_firestore.dart';

class Contact {
  String? id;
  String? name;
  String? phoneNumber;

  Contact({this.id, this.name, this.phoneNumber});

  factory Contact.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;

    return Contact(
      id: doc.id,
      name: data['name'],
      phoneNumber: data['phoneNumber'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }
}
