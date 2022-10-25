import 'package:flutter/material.dart';
import 'package:plantarmapp/view/login_view.dart';
import 'package:plantarmapp/view/register_view.dart';

void dialogPushCancelBox(BuildContext context, String errorMessage, String screen) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 0, 45, 0),
        title: const Text("Alert !", style: TextStyle(color: Color.fromARGB(255, 0, 255, 0)),),
        content: Text(errorMessage, style: const TextStyle(color: Color.fromARGB(255, 0, 255, 0)),),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            }, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 45, 0)),
              foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 255, 0))),
            child: const Text('Cancel', style: TextStyle(color: Color.fromARGB(255, 0, 255, 0)))),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                (screen == 'LoginView') ? '/login/' : '/register/',
                (route) => false
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 45, 0)),
              foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 255, 0))),
            child: const Text('Yes', style: TextStyle(color: Color.fromARGB(255, 0, 255, 0)))),       
        ],
        elevation: 24.0,
      );
    },
  );
}