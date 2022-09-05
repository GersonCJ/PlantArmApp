import 'package:flutter/material.dart';

void dialogOkBox(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 0, 45, 0),
        title: const Text("Error...", style: TextStyle(color: Color.fromARGB(255, 0, 255, 0)),),
        content: Text(errorMessage, style: const TextStyle(color: Color.fromARGB(255, 0, 255, 0)),),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            }, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 45, 0)),
              foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 255, 0))),
            child: const Text('OK', style: TextStyle(color: Color.fromARGB(255, 0, 255, 0)))),        
        ],
        elevation: 24.0,
      );
    },
  );
}