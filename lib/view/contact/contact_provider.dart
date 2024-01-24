import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> contacts = [];

  void addContact(Contact contact) {
    contacts.add(contact);
    notifyListeners();
  }
}
