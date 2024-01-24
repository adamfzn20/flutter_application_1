import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/contact/add_contact_page.dart';
import 'package:flutter_application_1/view/contact/contact_provider.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var contactProvider = Provider.of<ContactProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddContactPage()),
              );
            },
            child: Text('Add Contact'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contactProvider.contacts.length,
              itemBuilder: (context, index) {
                var contact = contactProvider.contacts[index];
                return ListTile(
                  title: Text(contact.name),
                  subtitle: Text(contact.phoneNumber),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
