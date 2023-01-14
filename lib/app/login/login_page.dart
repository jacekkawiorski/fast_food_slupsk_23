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
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(isCreatingAccount == true
                  ? 'Zarejestruj się'
                  : "Zaloguj się"),
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
                style: const TextStyle(color: Colors.red),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (isCreatingAccount == true) {
                    //rejestracja
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: widget.emailcontroller.text,
                        password: widget.passwordcontroller.text,
                      );
                    } catch (error) {
                      setState(() {
                        errormsg = error.toString();
                      });
                    }
                  } else {
                    //logowanie
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: widget.emailcontroller.text,
                        password: widget.passwordcontroller.text,
                      );
                    } catch (error) {
                      setState(() {
                        errormsg = error.toString();
                      });
                    }
                  }
                },
                child: Text(isCreatingAccount == true
                    ? 'Zarejestruj się'
                    : 'Zaloguj sie'),
              ),
              const SizedBox(height: 20),
              if (isCreatingAccount == false) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      isCreatingAccount = true;
                    });
                  },
                  child: const Text("Utwórz konto"),
                ),
              ],
              if (isCreatingAccount == true) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      isCreatingAccount = false;
                    });
                  },
                  child: const Text("Masz już konto ?"),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
