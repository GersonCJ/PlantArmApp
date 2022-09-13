import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void dialogVerificationBox(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 0, 45, 0),
        title: const Text("Alert !", style: TextStyle(color: Color.fromARGB(255, 0, 255, 0)),),
        content: const Text('Please verify your e-mail to continue and press close.', style: TextStyle(color: Color.fromARGB(255, 0, 255, 0)),),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            }, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 45, 0)),
              foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 255, 0))),
            child: const Text('Close', style: TextStyle(color: Color.fromARGB(255, 0, 255, 0)))),
          TextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              await user?.sendEmailVerification();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 45, 0)),
              foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 255, 0))),
            child: const Text('Verify', style: TextStyle(color: Color.fromARGB(255, 0, 255, 0)))),       
        ],
        elevation: 24.0,
      );
    },
  );
}