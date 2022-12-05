import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'dart:core';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphPoints {
  final num x;
  final num y;
  GraphPoints({required this.x, required this.y});
}

List<GraphPoints> graphPoints(List dominio, List medida) {
  return IterableZip([dominio, medida])
      .map((value) => GraphPoints(x: value[0], y: num.parse(value[1])))
      .toList();
}

class GraphTest extends StatelessWidget {
  final bool temp;
  final bool ph;
  final bool cd;
  final bool hd;

  GraphTest(
      {this.temp = false, this.ph = false, this.cd = false, this.hd = false});

  // const GraphTest({super.key});

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseFirestore.instance
        .collection('/posts')
        .doc('ReceivingValuesEsp')
        .collection('.json')
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: ref,
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
          // Construir a lista com TODOS os Counters em ordem crescente.
          final counterDesord = data.map((x) => x['ct']).toList();
          counterDesord.sort();
          final counterOrd = counterDesord;
          List ordenados = [];
          for (int i = 0; i < counterOrd.length; i++) {
            for (int j = 0; j < data.length; j++) {
              if (data[j]['ct'] == counterOrd[i]) {
                ordenados.add(data[j]);
              }
            }
          }
          // Construir o Dominio do mesmo tamanho da data.
          num tempoDeEnvio = 5;
          List domain = [];
          for (int i = 0; i < data.length; i++) {
            domain.add(tempoDeEnvio);
            tempoDeEnvio += 5;
          }
          // Construir o Measure de cada parâmetro.
          List measureAt = [];
          List measureWt = [];
          List measurePh = [];
          List measureCd = [];
          List measureHd = [];
          for (int i = 0; i < ordenados.length; i++) {
            measureAt.add(ordenados[i]['at']);
            measureWt.add(ordenados[i]['wt']);
            measurePh.add(ordenados[i]['ph']);
            measureCd.add(ordenados[i]['cd']);
            measureHd.add(ordenados[i]['hd']);
          }
          // Adicionar Escalabilidade de gráfico em função do tempo (horas, dias)
          String tempo = 'Minutes';
          List domainFlag = [];
          late List measureAtFlag = [];
          late List measureWtFlag = [];
          late List measurePhFlag = [];
          late List measureCdFlag = [];
          late List measureHdFlag = [];
          num measureAtFlagItem = 0;
          num measureWtFlagItem = 0;
          num measurePhFlagItem = 0;
          num measureCdFlagItem = 0;
          num measureHdFlagItem = 0;
          // Flag Horas - if / Flag Days - else if
          if (36 <= domain.length && domain.length < 864) {
            int flagHoras = 0;
            int domainFlagItem = 1;
            for (int i = 0; i < domain.length; i++) {
              flagHoras += 1;
              measureAtFlagItem += int.parse(measureAt[i]);
              measureWtFlagItem += int.parse(measureWt[i]);
              measurePhFlagItem += int.parse(measurePh[i]);
              measureCdFlagItem += int.parse(measureCd[i]);
              measureHdFlagItem += int.parse(measureHd[i]);
              if (flagHoras == 12) {
                measureAtFlagItem /= 12;
                measureWtFlagItem /= 12;
                measurePhFlagItem /= 12;
                measureCdFlagItem /= 12;
                measureHdFlagItem /= 12;
                measureAtFlag.add(measureAtFlagItem.toString());
                measureWtFlag.add(measureWtFlagItem.toString());
                measurePhFlag.add(measurePhFlagItem.toString());
                measureCdFlag.add(measureCdFlagItem.toString());
                measureHdFlag.add(measureHdFlagItem.toString());
                domainFlag.add(domainFlagItem);
                measureAtFlagItem = 0;
                measureWtFlagItem = 0;
                measurePhFlagItem = 0;
                measureCdFlagItem = 0;
                measureHdFlagItem = 0;
                domainFlagItem += 1;
                flagHoras = 0;
              }
            }
            domain = domainFlag;
            tempo = 'Hours';
            measureAt = measureAtFlag;
            measureWt = measureWtFlag;
            measurePh = measurePhFlag;
            measureCd = measureCdFlag;
            measureHd = measureHdFlag;
          } else if (domain.length >= 864) {
            int flagDays = 0;
            int domainFlagItem = 1;
            for (int i = 0; i < domain.length; i++) {
              flagDays += 1;
              measureAtFlagItem += int.parse(measureAt[i]);
              measureWtFlagItem += int.parse(measureWt[i]);
              measurePhFlagItem += int.parse(measurePh[i]);
              measureCdFlagItem += int.parse(measureCd[i]);
              measureHdFlagItem += int.parse(measureHd[i]);
              if (flagDays == 288) {
                measureAtFlagItem /= 288;
                measureWtFlagItem /= 288;
                measurePhFlagItem /= 288;
                measureCdFlagItem /= 288;
                measureHdFlagItem /= 288;
                measureAtFlag.add(measureAtFlagItem.toString());
                measureWtFlag.add(measureWtFlagItem.toString());
                measurePhFlag.add(measurePhFlagItem.toString());
                measureCdFlag.add(measureCdFlagItem.toString());
                measureHdFlag.add(measureHdFlagItem.toString());
                domainFlag.add(domainFlagItem);
                measureAtFlagItem = 0;
                measureWtFlagItem = 0;
                measurePhFlagItem = 0;
                measureCdFlagItem = 0;
                measureHdFlagItem = 0;
                domainFlagItem += 1;
                flagDays = 0;
              }
            }
            domain = domainFlag;
            tempo = 'Dias';
            measureAt = measureAtFlag;
            measureWt = measureWtFlag;
            measurePh = measurePhFlag;
            measureCd = measureCdFlag;
            measureHd = measureHdFlag;
          } else {}

          // Building Points

          return Container(
              child: (temp == true
                  ? SfCartesianChart(
                      series: [
                        LineSeries(
                            dataSource: graphPoints(domain, measureAt),
                            xValueMapper: (GraphPoints temperature, _) =>
                                temperature.x,
                            yValueMapper: (GraphPoints temperature, _) =>
                                temperature.y),
                        LineSeries(
                            dataSource: graphPoints(domain, measureWt),
                            xValueMapper: (GraphPoints temperature, _) =>
                                temperature.x,
                            yValueMapper: (GraphPoints temperature, _) =>
                                temperature.y)
                      ],
                      primaryXAxis: NumericAxis(
                          majorGridLines: const MajorGridLines(width: 0),
                          edgeLabelPlacement: EdgeLabelPlacement.shift,
                          title: AxisTitle(
                              text: 'Time ($tempo)',
                              textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 0, 255, 0)))),
                      primaryYAxis: NumericAxis(
                          axisLine: const AxisLine(width: 0),
                          majorTickLines: const MajorTickLines(size: 0),
                          title: AxisTitle(
                              text: 'Temperature (°C)',
                              textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 0, 255, 0)))),
                    )
                  : ph == true
                      ? SfCartesianChart(
                          series: [
                            LineSeries(
                                dataSource: graphPoints(domain, measurePh),
                                xValueMapper: (GraphPoints temperature, _) =>
                                    temperature.x,
                                yValueMapper: (GraphPoints temperature, _) =>
                                    temperature.y),
                          ],
                          primaryXAxis: NumericAxis(
                              majorGridLines: const MajorGridLines(width: 0),
                              edgeLabelPlacement: EdgeLabelPlacement.shift,
                              title: AxisTitle(
                                  text: 'Time ($tempo)',
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 0, 255, 0)))),
                          primaryYAxis: NumericAxis(
                              axisLine: const AxisLine(width: 0),
                              majorTickLines: const MajorTickLines(size: 0),
                              title: AxisTitle(
                                  text: 'PH',
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 0, 255, 0)))),
                        )
                      : cd == true
                          ? SfCartesianChart(
                              series: [
                                LineSeries(
                                    dataSource: graphPoints(domain, measureCd),
                                    xValueMapper:
                                        (GraphPoints temperature, _) =>
                                            temperature.x,
                                    yValueMapper:
                                        (GraphPoints temperature, _) =>
                                            temperature.y),
                              ],
                              primaryXAxis: NumericAxis(
                                  majorGridLines:
                                      const MajorGridLines(width: 0),
                                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                                  title: AxisTitle(
                                      text: 'Tempo ($tempo)',
                                      textStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 0, 255, 0)))),
                              primaryYAxis: NumericAxis(
                                  axisLine: const AxisLine(width: 0),
                                  majorTickLines: const MajorTickLines(size: 0),
                                  title: AxisTitle(
                                      text: 'Conductivity',
                                      textStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 0, 255, 0)))),
                            )
                          : hd == true
                              ? SfCartesianChart(
                                  series: [
                                    LineSeries(
                                        dataSource:
                                            graphPoints(domain, measurePh),
                                        xValueMapper:
                                            (GraphPoints temperature, _) =>
                                                temperature.x,
                                        yValueMapper:
                                            (GraphPoints temperature, _) =>
                                                temperature.y),
                                  ],
                                  primaryXAxis: NumericAxis(
                                      majorGridLines:
                                          const MajorGridLines(width: 0),
                                      edgeLabelPlacement:
                                          EdgeLabelPlacement.shift,
                                      title: AxisTitle(
                                          text: 'Tempo ($tempo)',
                                          textStyle: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 0, 255, 0)))),
                                  primaryYAxis: NumericAxis(
                                      axisLine: const AxisLine(width: 0),
                                      majorTickLines:
                                          const MajorTickLines(size: 0),
                                      title: AxisTitle(
                                          text: 'Humidity',
                                          textStyle: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 0, 255, 0)))),
                                )
                              : null));
        });
  }
}
