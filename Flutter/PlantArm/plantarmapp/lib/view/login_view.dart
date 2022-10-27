import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantarmapp/dialog/dialog_ok_box.dart';
import 'package:plantarmapp/dialog/dialog_push_cancel_box.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:plantarmapp/dialog/dialog_verification_box.dart';
import 'package:plantarmapp/view/main_ui_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
    late final TextEditingController _password;

  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
      body: 
        Column(
            children: [
              TextField(
                controller: _email,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
              TextField(
                controller: _password,
                enableSuggestions: false,
                autocorrect: false,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(onPressed: (() async {
                try {
                final username = _email.text;
                final password = _password.text;
                final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: username,
                  password: password);
                }
                on FirebaseAuthException catch (e){
                  final messageError = e.code.toString();
                  final treatedMessageError = toBeginningOfSentenceCase(messageError.split('-').join(' ')).toString();
                  dialogOkBox(context, treatedMessageError);
                  if (e.code == 'user-not-found'){
                  final complement = '$treatedMessageError. Would you like to Register a new user ?';
                  dialogPushCancelBox(context, complement, 'RegisterView');
                } else {
                  dialogOkBox(context, treatedMessageError);
                }
                }
                final user = FirebaseAuth.instance.currentUser;
                if (user?.emailVerified ?? false){
                  if (!mounted) return;
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/mainui/',
                    (route) => false
              );
                }else {
                  if (!mounted) return;
                  dialogVerificationBox(context);
                }
              }), style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 45, 0)),
                    foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 255, 0))),
                  child: 
                    const Text('Log In')),
            ],
          ));
          }
        }