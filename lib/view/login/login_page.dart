import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/login/aunt_provider.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<AuthProvider>(
          builder: (context, authProvider, _) {
            // Fixed parameter name
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      await authProvider
                          .signInWithGoogle(); // Corrected method call
                      authProvider
                          .checkLoginStatus(); // Check login status after signing in
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[300],
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Image(
                            image: AssetImage('assets/google.png'),
                          ),
                        ),
                        Text('Login With Google'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Visibility(
                  visible: authProvider.visible,
                  child: const Text("Welcome!"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
