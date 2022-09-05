import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plantarmapp/dialog/dialog_ok_box.dart';
import 'package:plantarmapp/firebase_options.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;


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
        title: const Text('PlantArm'),
        backgroundColor: const Color.fromARGB(255, 0, 45, 0),
        foregroundColor: const Color.fromARGB(255, 0, 255, 0),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform
        ),
        builder: (context, snapshot){

          switch (snapshot.connectionState){
            
            case ConnectionState.done:
              return Column(
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
                    try{
                      final username = _email.text;
                      final password = _password.text;
                      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: username,
                        password: password);
                    }
                    on FirebaseAuthException catch (e){
                      final messageError = e.code.toString();
                      final treatedMessageError = toBeginningOfSentenceCase(messageError.split('-').join(' ')).toString();
                      dialogOkBox(context, treatedMessageError);
                      
                      
                    }
                      
                  }), style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 45, 0)),
                        foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 255, 0))),
                      child: 
                        const Text('Register')),
                ],
              );
              default:
                return const Text('Loading...');

          }
        }
      )
    );
  }
}