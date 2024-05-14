import 'package:flutter/material.dart';

class ScenarioOne extends StatefulWidget {
  const ScenarioOne({super.key});

  @override
  State<ScenarioOne> createState() => _ScenarioOneState();
}

class _ScenarioOneState extends State<ScenarioOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Scenario One')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: Text(
                      textAlign: TextAlign.center,
                      "Make the screen reader skip this text and focus on the images. Also, add the necessary information for the user to understand the images."),
                ),
                Image.asset(
                  'assets/appshacklogo.png',
                  width: 200,
                  height: 200,
                ),
                const ImageIcon(
                  AssetImage('assets/appshacklogo.png'),
                  size: 100,
                ),
              ],
            ),
          ),
        ));
  }
}
