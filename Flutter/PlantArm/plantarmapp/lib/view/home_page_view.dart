import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plantarmapp/firebase_options.dart';
import 'package:plantarmapp/view/login_view.dart';
import 'package:plantarmapp/view/register_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HydroPlant'),
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
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterView())
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 45, 0)),
                      foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 255, 0))),
                    child: const Text('Register')),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginView(),)
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 45, 0)),
                      foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 255, 0))),
                    child: const Text('Login'))
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
