import 'package:flutter/material.dart';

class ScenarioFour extends StatefulWidget {
  const ScenarioFour({super.key});

  @override
  State<ScenarioFour> createState() => _ScenarioFourState();
}

class _ScenarioFourState extends State<ScenarioFour> {
  int _selectedValue = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Scenario Four')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: Text(
                    textAlign: TextAlign.center,
                    "Some widgets can be hard to understand if users don't get the full picture. Make sure the screen reader reads relevant information in one go and lets users choose between different options with custom actions."),
              ),
              const SizedBox(height: 64),
              _buildQuestion(),
            ],
          ),
        ));
  }

  Widget _buildQuestion() {
    return Column(
      children: [
        const Row(
          children: [
            Text("How satisfied are you with this scenario?"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildRadioButton('Dissatisfied', 1),
            _buildRadioButton('Neutral', 2),
            _buildRadioButton('Satisfied', 3),
          ],
        )
      ],
    );
  }

  Widget _buildRadioButton(String text, int value) {
    return Column(
      children: [
        Radio<int>(
          value: value,
          groupValue: _selectedValue,
          onChanged: (int? newValue) {
            setState(() {
              _selectedValue = newValue!;
            });
          },
        ),
        Text(text),
      ],
    );
  }
}
