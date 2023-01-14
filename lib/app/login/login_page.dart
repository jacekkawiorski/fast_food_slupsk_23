import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errormsg = '';

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
              const SizedBox(height: 50),
              TextField(
                decoration: const InputDecoration(hintText: 'Email'),
                controller: widget.emailcontroller,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Password'),
                controller: widget.passwordcontroller,
                obscureText: true,
              ),
              const SizedBox(height: 30),
              Text(
                errormsg,
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: widget.emailcontroller.text,
                      password: widget.passwordcontroller.text,
                    );
                  } catch (error) {
                    setState(
                      () {
                        errormsg = error.toString();
                      },
                    );
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
