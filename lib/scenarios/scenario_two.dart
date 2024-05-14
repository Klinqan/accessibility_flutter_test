import 'package:flutter/material.dart';

class ScenarioTwo extends StatefulWidget {
  const ScenarioTwo({super.key});

  @override
  State<ScenarioTwo> createState() => _ScenarioTwoState();
}

class _ScenarioTwoState extends State<ScenarioTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Scenario Two')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: Text(
                      textAlign: TextAlign.center,
                      "Make sure that the screen reader reads the whole left column first before reading the right column."),
                ),
                for (var i = 0; i < 4; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Left Column $i"),
                      Text("Right Column $i"),
                    ],
                  ),
              ],
            ),
          ),
        ));
  }
}
