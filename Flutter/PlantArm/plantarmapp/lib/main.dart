import 'package:flutter/material.dart';
import 'package:plantarmapp/view/home_page_view.dart';
import 'package:plantarmapp/view/login_view.dart';
import 'package:plantarmapp/view/main_ui_settings_view.dart';
import 'package:plantarmapp/view/main_ui_view.dart';
import 'package:plantarmapp/view/register_view.dart';

import 'constants/const.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(
    MaterialApp(
        title: 'HydroPlant App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        routes: {
          loginRoute: (context) => const LoginView(),
          registerRoute: (context) => const RegisterView(),
          mainuiRoute: (context) => const MainUiView(),
          mainuiSettingsRoute: (context) => const MainUiSettingsView(),
        }),
  );
}
