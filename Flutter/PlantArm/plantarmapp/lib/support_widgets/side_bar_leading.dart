import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 0, 45, 0),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                image: AssetImage('assets/images/hydroplant.png'),
                fit: BoxFit.cover,
                ),
            ),
            child: Text(''),
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text(
              'Statistics',
              style: TextStyle(
                fontSize: 20.0
              )),
            textColor: const Color.fromARGB(255, 0, 255, 0),
            iconColor: const Color.fromARGB(255, 0, 255, 0),
            onTap: () => null,
          ),
          const Divider(
            thickness: 2.0,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Module Settings',
              style: TextStyle(
                fontSize: 20.0
              ),),
            // selectedTileColor: const Color.fromARGB(255, 251, 255, 0),
            textColor: const Color.fromARGB(255, 0, 255, 0),
            iconColor: const Color.fromARGB(255, 0, 255, 0),
            onTap: () => {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/mainui/',
                (route) => false)},
          ),
        ],
      ),
    );
  }
}