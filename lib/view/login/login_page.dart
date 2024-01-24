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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<AuthProvider>(builder: (context, controller, _) {
            return Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Masukan Email',
                    ),
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Masukan Password',
                      suffixIcon: IconButton(
                        icon: Icon(controller.passwordObscureText
                            ? Icons.visibility_off_sharp
                            : Icons.visibility),
                        onPressed: () {
                          controller.passwordObscureTextStatus();
                        },
                      ),
                    ),
                    obscureText: controller.passwordObscureText,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      String email = controller.emailController.text.trim();
                      String password =
                          controller.passwordController.text.trim();

                      await controller.signInWithEmailAndPassword(
                          email, password);
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {
                      // controller.handleSignIn(context);
                    },
                    child: const SizedBox(
                      height: 50,
                      width: 50,
                      child: Image(
                        image: AssetImage('assets/google.png'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
