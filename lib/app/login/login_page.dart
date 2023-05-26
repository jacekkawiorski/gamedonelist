import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Zaloguj się"),
            TextField(
              controller: widget.emailController,
              decoration: const InputDecoration(hintText: 'Podaj E-mail'),
            ),
            TextField(
              controller: widget.passwordController,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Podaj Hasło'),
            ),
            const SizedBox(height: 35),
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: widget.emailController.text,
                      password: widget.passwordController.text);
                } catch (error) {
                  setState(() {
                    errorMessage = error.toString();
                  });
                }
              },
              child: const Text('Zaloguj'),
            )
          ],
        ),
      ),
    ));
  }
}