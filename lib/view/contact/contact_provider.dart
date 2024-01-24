import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> contacts = [];
  late Stream<List<Contact>> contactsStream;

  ContactProvider() {
    contactsStream = _createContactsStream();
  }

  String? getCurrentUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  Future<void> addContact(Contact contact) async {
    try {
      await FirebaseFirestore.instance
          .collection('contacts')
          .doc(getCurrentUserId())
          .collection('user_contacts')
          .add(contact.toFirestore());
      contacts.add(contact);
      notifyListeners();
      print('Contact added');
    } catch (error) {
      print('Failed to add Contact: $error');
    }
  }

  Stream<List<Contact>> _createContactsStream() {
    return FirebaseFirestore.instance
        .collection('contacts')
        .doc(getCurrentUserId())
        .collection('user_contacts')
        .snapshots()
        .map((QuerySnapshot query) {
      contacts.clear();
      for (var doc in query.docs) {
        contacts.add(Contact.fromFirestore(doc));
      }
      return List.from(contacts);
    });
  }

  String getInitials(String name) {
    List<String> nameParts = name.split(' ');
    String initials = '';

    for (int i = 0; i < nameParts.length; i++) {
      if (nameParts[i].isNotEmpty) {
        initials += nameParts[i][0].toUpperCase();
      }
    }

    return initials;
  }
}
