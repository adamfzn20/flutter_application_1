import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/contact/contact_page.dart';
import 'package:flutter_application_1/view/login/login_page.dart';
// import 'package:flutter_application_1/view/map/map_page.dart';
import 'package:flutter_application_1/view/media/media_page.dart';
// import 'package:flutter_application_1/view/session/session_page.dart';
import 'package:flutter_application_1/widget/button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomButton(
                  icon: Icons.person,
                  text: "Login",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  }),
              CustomButton(
                  icon: Icons.location_on,
                  text: "Map",
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const MapPage()),
                    // );
                  }),
              CustomButton(
                  icon: Icons.contact_phone,
                  text: "Contact",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactPage()),
                    );
                  }),
              CustomButton(
                icon: Icons.perm_media_rounded,
                text: "Media",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MediaPage()),
                  );
                },
              ),
              CustomButton(
                  icon: Icons.data_usage,
                  text: "Data  Session",
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const SessionsPage()),
                    // );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
