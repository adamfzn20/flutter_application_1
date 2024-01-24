import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact_model.dart';
import 'package:flutter_application_1/view/contact/contact_provider.dart';
import 'package:provider/provider.dart';

class AddContactPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  AddContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    var contactProvider = Provider.of<ContactProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Add Contact')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            ElevatedButton(
              onPressed: () {
                var name = nameController.text;
                var phone = phoneController.text;
                var newContact = Contact(name: name, phoneNumber: phone);
                contactProvider.addContact(newContact);

                // Add the contact to Firebase here
                // FirebaseFirestore.instance
                //     .collection('contacts')
                //     .add({'name': name, 'phone': phone});

                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
