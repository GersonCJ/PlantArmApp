import 'package:flutter/material.dart';
import 'package:plantarmapp/support_widgets/drop_down_menu_luminosity.dart';
import 'package:plantarmapp/support_widgets/side_bar_leading.dart';

class MainUiSettingsView extends StatefulWidget {
  const MainUiSettingsView({super.key});

  @override
  State<MainUiSettingsView> createState() => _MainUiSettingsViewState();
}

class _MainUiSettingsViewState extends State<MainUiSettingsView> {

  late final TextEditingController _temperature;
  late final TextEditingController _luminosity;
  late final TextEditingController _ph1;
  late final TextEditingController _ph2;
  late final TextEditingController _conductivity1;
  late final TextEditingController _conductivity2;

  @override
  void initState() {
    _temperature = TextEditingController();
    _luminosity = TextEditingController();
    _ph1 = TextEditingController();
    _ph2 = TextEditingController();
    _conductivity1 = TextEditingController();
    _conductivity2 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
     _temperature = TextEditingController();
    _luminosity = TextEditingController();
    _ph1 = TextEditingController();
    _ph2 = TextEditingController();
    _conductivity1 = TextEditingController();
    _conductivity2 = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 45, 0),
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text('HydroPlant'),
        backgroundColor: const Color.fromARGB(255, 0, 45, 0),
        foregroundColor: const Color.fromARGB(255, 0, 255, 0),
        
      ),
      resizeToAvoidBottomInset: false,
      body:
        Column(
          children: [ 
            SizedBox(
              height: 130,
              child:
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: 
                    Row(
                      children: [
                        const Text(
                          'Air Temperature: ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 0, 255, 0),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child:      
                            TextField(
                              controller: _temperature,
                              enableSuggestions: true,
                              autocorrect: false,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 255, 0)),
                              decoration: const InputDecoration(
                                fillColor: Color.fromARGB(255, 0, 255, 0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 255, 0)),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 255, 0))
                                ),
                              ),
                              cursorColor: const Color.fromARGB(255, 0, 255, 0),
                            ),
                        ),
                        const Text(
                          ' °C',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 0, 255, 0),
                          ),
                          ),                     
                      ],
                    ),
                ),   
            ),
            SizedBox(
              height: 130,
              child:
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: 
                  Row(
                    children: const [
                      Text(
                        'Luminosity: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 255, 0),
                        )
                      ),
                      SizedBox(
                        width: 200,
                        child: DropdownLuminosity()
                      )
                    ],
                  ),
                ),   
            ),
            SizedBox(
              height: 168,
              child:
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: 
                  Row(
                    children: const [
                      Text(
                        'Luminosity: ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 255, 0),
                        )
                      ),
                      Text('Input'),
                    ],
                  ),
                ),   
            ), 
          ],
        ),
        
      
    );
  }
}