import 'package:flutter/material.dart';
import 'package:plantarmapp/view/home_page_view.dart';
import 'package:plantarmapp/view/login_view.dart';
import 'package:plantarmapp/view/main_ui_settings_view.dart';
import 'package:plantarmapp/view/main_ui_view.dart';
import 'package:plantarmapp/view/register_view.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/login/': (context) => const LoginView(),
        '/register/': (context) => const RegisterView(),
        '/mainui/': (context) => const MainUiView(),
        '/mainuisettings/':(context) => const MainUiSettingsView(),
      }
    ),);
}
