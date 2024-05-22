import 'package:flutter/material.dart';

class ScenarioTwo extends StatefulWidget {
  const ScenarioTwo({super.key});

  @override
  State<ScenarioTwo> createState() => _ScenarioTwoState();
}

class _ScenarioTwoState extends State<ScenarioTwo> {
  List<String> columnStrings = [
    "Fruits and Veggies",
    "Whole Grains",
    "Apples",
    "Brown Rice",
    "Spinach",
    "Quinoa",
    "Carrots",
    "Oatmeal",
    "Bananas",
    "Whole Wheat Bread",
    "Broccoli",
    "Barley",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Scenario Two')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 128,
                ),
                for (var i = 0; i < 11; i += 2)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        columnStrings[i],
                        style: i == 0
                            ? const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.red)
                            : null,
                      ),
                      Text(
                        columnStrings[i + 1],
                        style: i == 0
                            ? const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.red)
                            : null,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ));
  }
}
