import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantarmapp/dialog/dialog_ok_box.dart';
import 'package:plantarmapp/dialog/dialog_push_cancel_box.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:plantarmapp/dialog/dialog_verification_box.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HydroPlant'),
          backgroundColor: const Color.fromARGB(255, 0, 45, 0),
          foregroundColor: const Color.fromARGB(255, 0, 255, 0),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 45, 0),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            Column(
              children: [
                const SizedBox(height: 220, child: Text('')),
                SizedBox(
                  width: 360,
                  child: TextField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    style:
                        const TextStyle(color: Color.fromARGB(255, 0, 255, 0)),
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                        fillColor: Color.fromARGB(255, 0, 255, 0),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 0, 255, 0)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 255, 0))),
                        hintText: 'Email...',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 255, 0))),
                    cursorColor: const Color.fromARGB(255, 0, 255, 0),
                  ),
                ),
                SizedBox(
                  width: 360,
                  child: TextField(
                    controller: _password,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                    style:
                        const TextStyle(color: Color.fromARGB(255, 0, 255, 0)),
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                        fillColor: Color.fromARGB(255, 0, 255, 0),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 0, 255, 0)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 255, 0))),
                        hintText: 'Password...',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 255, 0))),
                    cursorColor: const Color.fromARGB(255, 0, 255, 0),
                  ),
                ),
                const Divider(),
                OutlinedButton(
                    onPressed: (() async {
                      try {
                        final username = _email.text;
                        final password = _password.text;
                        final userCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: username, password: password);
                      } on FirebaseAuthException catch (e) {
                        final messageError = e.code.toString();
                        final treatedMessageError = toBeginningOfSentenceCase(
                                messageError.split('-').join(' '))
                            .toString();
                        if (e.code == 'email-already-in-use') {
                          final complement =
                              '$treatedMessageError. Would you like to go to Login ?';
                          dialogPushCancelBox(context, complement, 'LoginView');
                        } else {
                          dialogOkBox(context, treatedMessageError);
                        }
                      }
                      final user = FirebaseAuth.instance.currentUser;
                      if (user?.emailVerified ?? false) {
                      } else {
                        if (!mounted) return;
                        dialogVerificationBox(context);
                      }
                    }),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 45, 0),
                      foregroundColor: const Color.fromARGB(255, 0, 255, 0),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 0, 255, 0),
                      ),
                    ),
                    child: const Text('Register')),
              ],
            ),
          ]),
        ));
  }
}
