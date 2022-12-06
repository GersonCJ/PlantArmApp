import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataInstantMeasure extends StatelessWidget {
  final bool at;
  final bool wt;
  final bool ph;
  final bool cd;
  final bool hd;

  DataInstantMeasure(
      {this.at = false,
      this.wt = false,
      this.ph = false,
      this.cd = false,
      this.hd = false});

  final Stream<QuerySnapshot> _ref = FirebaseFirestore.instance
      .collection('/posts')
      .doc('ReceivingValuesEsp')
      .collection('.json')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _ref,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text(
              'Something went wrong',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 255, 0),
                fontSize: 25,
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text(
              "Loading",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 255, 0),
                fontSize: 25,
              ),
            );
          }
          final data = snapshot.data!.docs;
          List specificDoc = [];
          int counter = 0;
          // Procura pelo maior counter
          for (int i = 0; i < data.length; i++) {
            if (int.parse(data[i]['ct']) > counter) {
              counter = int.parse(data[i]['ct']);
              specificDoc.add(data[i]);
            }
          }
          final lastCounter = {"ct": counter};
          FirebaseFirestore.instance
              .collection('/SettingLastCounter')
              .doc('Value')
              .set(lastCounter);
          final query = specificDoc[specificDoc.length - 1];
          return Container(
            child: (wt == true
                ? Text(
                    query['wt'],
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 255, 0),
                      fontSize: 25,
                    ),
                  )
                : at == true
                    ? Text(
                        query['at'],
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 255, 0),
                          fontSize: 25,
                        ),
                      )
                    : cd == true
                        ? Text(
                            query['cd'],
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 255, 0),
                              fontSize: 25,
                            ),
                          )
                        : ph == true
                            ? Text(
                                query['ph'],
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 255, 0),
                                  fontSize: 25,
                                ),
                              )
                            : hd == true
                                ? Text(
                                    query['hd'],
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 255, 0),
                                      fontSize: 25,
                                    ),
                                  )
                                : null),
          );
        });
  }
}
