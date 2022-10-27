import 'package:flutter/material.dart';
import 'package:plantarmapp/support_widgets/side_bar_leading.dart';

class MainUiView extends StatefulWidget {
  const MainUiView({super.key});

  @override
  State<MainUiView> createState() => _MainUiViewState();
}

class _MainUiViewState extends State<MainUiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text('HydroPlant'),
        backgroundColor: const Color.fromARGB(255, 0, 45, 0),
        foregroundColor: const Color.fromARGB(255, 0, 255, 0),
        
      ),
      
    );
  }
}