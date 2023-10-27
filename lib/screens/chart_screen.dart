import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chartscreen extends StatelessWidget {
  const Chartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: PieChart( swapAnimationDuration: Duration(milliseconds: 0),swapAnimationCurve: Curves.bounceIn,
                  PieChartData(
                    sections:[
                    PieChartSectionData(value: 200,title: "Tech fest",color: Color.fromARGB(255, 43, 200, 189)),
                    PieChartSectionData(value: 350,title: "Amigoz",color: Color.fromARGB(255, 151, 163, 169)),
                    PieChartSectionData(value: 150,title: "Bridegon",color: Color.fromARGB(255, 55, 145, 139)),
         
                    ]),
                  ),
    );
         
  }
}