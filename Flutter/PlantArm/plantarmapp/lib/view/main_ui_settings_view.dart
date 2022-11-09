import 'package:flutter/material.dart';
import 'package:plantarmapp/dialog/dialog_ok_box.dart';
import 'package:plantarmapp/support_widgets/side_bar_leading.dart';

// ------------------------------------------------------------------------------------- Drop_down_menu_pre-defined-list

List<DropdownMenuItem<String>> get dropdownPredefinedItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(value: 'Choose...', child: Text('Choose...')),
    DropdownMenuItem(value: 'Lettuce', child: Text('Lettuce')),
    DropdownMenuItem(value: 'Carrot', child: Text('Carrot')),
    DropdownMenuItem(value: 'Tomato', child: Text('Tomato')),
  ];
  return menuItems;
}

final mapOfValues = {
  'Lettuce': [
    '5',
    'VEG',
    '4.5',
    '6.5',
    '1',
    '2',
  ],
  'Carrot': [
    '15',
    'VEG+BLOOM',
    '5.5',
    '6',
    '3',
    '4',
  ],
  'Tomato': [
    '10',
    'BLOOM',
    '6',
    '7.5',
    '5',
    '6',
  ],
};

class DropdownPredefined extends StatefulWidget {
  const DropdownPredefined({super.key});

  @override
  State<DropdownPredefined> createState() => _DropdownPredefinedState();
}

class _DropdownPredefinedState extends State<DropdownPredefined> {
  String selectedPredefinedValue = "Choose...";
  final _dropdownPredefinedFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _dropdownPredefinedFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 0, 255, 0)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 255, 0))),
                ),
                validator: (value) =>
                    value == 'Choose...' ? "Choose a luminosity type !" : null,
                value: selectedPredefinedValue,
                items: dropdownPredefinedItems,
                dropdownColor: const Color.fromARGB(255, 0, 45, 0),
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 255, 0),
                  fontSize: 20,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedPredefinedValue = newValue!;
                  });
                })
          ],
        ));
  }
}

// ------------------------------------------------------------------------------------- Drop_down_menu_luminosity

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(value: 'Choose...', child: Text('Choose...')),
    DropdownMenuItem(value: 'VEG', child: Text('VEG')),
    DropdownMenuItem(value: 'BLOOM', child: Text('BLOOM')),
    DropdownMenuItem(value: 'VEG+BLOOM', child: Text('VEG+BLOOM')),
  ];
  return menuItems;
}

class DropdownLuminosity extends StatefulWidget {
  const DropdownLuminosity({super.key});

  @override
  State<DropdownLuminosity> createState() => _DropdownLuminosityState();
}

class _DropdownLuminosityState extends State<DropdownLuminosity> {
  String selectedValue = "Choose...";
  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _dropdownFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 0, 255, 0)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 255, 0))),
                ),
                validator: (value) =>
                    value == 'Choose...' ? "Choose a luminosity type !" : null,
                value: selectedValue,
                items: dropdownItems,
                dropdownColor: const Color.fromARGB(255, 0, 45, 0),
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 255, 0),
                  fontSize: 20,
                ),
                onChanged: (String? newValue) {
                  if (_dropdownFormKey.currentState!.validate()) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  }
                })
          ],
        ));
  }
}

// ------------------------------------------------------------------------------------------

class MainUiSettingsView extends StatefulWidget {
  const MainUiSettingsView({super.key});

  @override
  State<MainUiSettingsView> createState() => _MainUiSettingsViewState();
}

class _MainUiSettingsViewState extends State<MainUiSettingsView> {
  final keyDropdown = GlobalKey<_DropdownLuminosityState>();
  final keyDropdownPredefined = GlobalKey<_DropdownPredefinedState>();
  late final TextEditingController _temperature;
  late final TextEditingController _ph1;
  late final TextEditingController _ph2;
  late final TextEditingController _conductivity1;
  late final TextEditingController _conductivity2;

  @override
  void initState() {
    _temperature = TextEditingController();
    _ph1 = TextEditingController();
    _ph2 = TextEditingController();
    _conductivity1 = TextEditingController();
    _conductivity2 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _temperature.dispose();
    _ph1.dispose();
    _ph2.dispose();
    _conductivity1.dispose();
    _conductivity2.dispose();
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
      body: Column(
        children: [
          SizedBox(
            height: 130,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Text(
                    'Air Temperature:  ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 255, 0),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: _temperature,
                      enableSuggestions: true,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 255, 0)),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        fillColor: Color.fromARGB(255, 0, 255, 0),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 0, 255, 0)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 255, 0))),
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Text('Luminosity: ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 255, 0),
                      )),
                  SizedBox(
                      width: 200, child: DropdownLuminosity(key: keyDropdown)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 130,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Text('PH: ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 255, 0),
                      )),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: _ph1,
                      enableSuggestions: true,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 255, 0)),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Min',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 255, 0)),
                        fillColor: Color.fromARGB(255, 0, 255, 0),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 0, 255, 0)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 255, 0))),
                      ),
                      cursorColor: const Color.fromARGB(255, 0, 255, 0),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: _ph2,
                      enableSuggestions: true,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 255, 0)),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Max',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 255, 0)),
                        fillColor: Color.fromARGB(255, 0, 255, 0),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 0, 255, 0)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 255, 0))),
                      ),
                      cursorColor: const Color.fromARGB(255, 0, 255, 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 130,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Text('Conductivity: ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 255, 0),
                      )),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: _conductivity1,
                      enableSuggestions: true,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 255, 0)),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Min',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 255, 0)),
                        fillColor: Color.fromARGB(255, 0, 255, 0),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 0, 255, 0)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 255, 0))),
                      ),
                      cursorColor: const Color.fromARGB(255, 0, 255, 0),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: _conductivity2,
                      enableSuggestions: true,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 255, 0)),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Max',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 255, 0)),
                        fillColor: Color.fromARGB(255, 0, 255, 0),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 0, 255, 0)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 255, 0))),
                      ),
                      cursorColor: const Color.fromARGB(255, 0, 255, 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
              height: 115,
              child: Column(
                children: [
                  const Text('...Or you can choose from a Pre-defined list...',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 255, 0), fontSize: 15)),
                  SizedBox(
                    width: 200,
                    child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: DropdownPredefined(key: keyDropdownPredefined)),
                  ),
                ],
              )),
          OutlinedButton(
            onPressed: () {
              final valueDropdownLuminosity =
                  keyDropdown.currentState!.selectedValue;
              final valueDropdownPredefined =
                  keyDropdownPredefined.currentState!.selectedPredefinedValue;
              final temperature = _temperature.text;
              final ph1 = _ph1.text;
              final ph2 = _ph2.text;
              final cond1 = _conductivity1.text;
              final cond2 = _conductivity2.text;
              if ((valueDropdownLuminosity == 'Choose...' ||
                      temperature == '' ||
                      ph1 == '' ||
                      ph2 == '' ||
                      cond1 == '' ||
                      cond2 == '') &&
                  valueDropdownPredefined == 'Choose...') {
                const error =
                    'Set the desired values and choose one of the luminosity types or choose one of the pre-defined values !';
                dialogOkBox(context, error);
              } else if (valueDropdownPredefined != 'Choose...') {
                List<String> listValues = mapOfValues[keyDropdownPredefined
                    .currentState!.selectedPredefinedValue]!;
                _temperature.text = listValues[0];
                _ph1.text = listValues[2];
                _ph2.text = listValues[3];
                _conductivity1.text = listValues[4];
                _conductivity2.text = listValues[5];
                setState(() {
                  keyDropdown.currentState!.selectedValue = listValues[1];
                  keyDropdownPredefined.currentState!.selectedPredefinedValue =
                      'Choose...';
                });
                const message =
                    'Verify if the values set were those desired. Correct them if you need and confirm by clicking in the "Set Values" button';
                dialogOkBox(context, message, typeBox: 'Alert !');
              } else {
                final sendingValues = {
                  "t": temperature,
                  "lum": valueDropdownLuminosity,
                  "p1": ph1,
                  "p2": ph2,
                  "c1": cond1,
                  "c2": cond2
                };
                _temperature.clear();
                _ph1.clear();
                _ph2.clear();
                _conductivity1.clear();
                _conductivity2.clear();
                setState(() {
                  keyDropdown.currentState!.selectedValue = 'Choose...';
                });

                print('cond 3 -ok');
              }
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 45, 0),
              foregroundColor: const Color.fromARGB(255, 0, 255, 0),
              side: const BorderSide(
                color: Color.fromARGB(255, 0, 255, 0),
              ),
            ),
            child: const Text(
              'Set Values',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
