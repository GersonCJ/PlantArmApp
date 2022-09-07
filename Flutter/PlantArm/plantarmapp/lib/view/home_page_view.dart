import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plantarmapp/firebase_options.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              return const Text('Done');
              default:
                return const Text('Loading...');

          }
        }
      )
    );
  }
}
