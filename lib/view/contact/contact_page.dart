import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact_model.dart';
import 'package:flutter_application_1/view/contact/add_contact_page.dart';
import 'package:flutter_application_1/view/contact/contact_provider.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    var contactProvider = Provider.of<ContactProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Contact>>(
              stream: contactProvider.contactsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final contacts = snapshot.data;

                if (contacts == null || contacts.isEmpty) {
                  return const Center(
                    child: Text('No Contacts yet'),
                  );
                }

                return ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return Card(
                      margin: const EdgeInsets.all(16.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(
                            contactProvider.getInitials(contact.name ?? ''),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(contact.name ?? ''),
                        subtitle: Text(contact.phoneNumber ?? ''),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddContactPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
