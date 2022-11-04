import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      value: 'Choose...',
      child: Text('Choose...')
    ),
    const DropdownMenuItem(
      value: 'VEG',
      child: Text('VEG')
    ),
    const DropdownMenuItem(
      value: 'BLOOM',
      child: Text('BLOOM')
    ),
    const DropdownMenuItem(
      value: 'VEG+BLOOM',
      child: Text('VEG+BLOOM')
    ),
    
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
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 255, 0)),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 255, 0))
            ),
            ),
            validator: (value) => value == 'Choose...' ? "Choose a luminosity type !" : null,
            value: selectedValue,
            items: dropdownItems,
            dropdownColor: const Color.fromARGB(255, 0, 45, 0),
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 255, 0),
              fontSize: 20,
            ),
            onChanged: (String? newValue){
              if (_dropdownFormKey.currentState!.validate()){
              setState(() {
                selectedValue = newValue!;
              }
              );}
            }
          )
        ],
      )
    );
      
  }
}