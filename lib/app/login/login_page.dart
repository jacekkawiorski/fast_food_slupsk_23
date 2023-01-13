import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Zaloguj sie do aplikacji"),
              const SizedBox(
                height: 50,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Email'),
                controller: emailcontroller,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Password'),
                controller: passwordcontroller,
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailcontroller.text,
                      password: passwordcontroller.text,
                    );
                  } catch (error) {
                    print(error);
                  }
                },
                child: const Text('Zaloguj sie'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
