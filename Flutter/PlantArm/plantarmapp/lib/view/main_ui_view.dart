import 'package:flutter/material.dart';
import 'package:plantarmapp/support_widgets/futue_data_measure.dart';
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
      backgroundColor: const Color.fromARGB(255, 0, 45, 0),
      body: Column(
        children: [
          const SizedBox(
            height: 70,
            width: 400,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Text(
                'Instant values',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 255, 0),
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 70,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Text(
                    'Air Temperature: ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 255, 0),
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  DataInstantMeasure(
                    at: true,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Text(
                    'Water Temperature: ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 255, 0),
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  DataInstantMeasure(
                    wt: true,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Text(
                    'PH:  ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 255, 0),
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  DataInstantMeasure(
                    ph: true,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Text(
                    'Conductivity: ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 255, 0),
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  DataInstantMeasure(
                    cd: true,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Text(
                    'Humidity: ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 255, 0),
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  DataInstantMeasure(
                    hd: true,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 70,
            width: 400,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Text(
                'Measuring',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 255, 0),
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
