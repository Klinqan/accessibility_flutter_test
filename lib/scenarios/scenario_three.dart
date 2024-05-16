import 'package:flutter/material.dart';

class ScenarioThree extends StatefulWidget {
  const ScenarioThree({super.key});

  @override
  State<ScenarioThree> createState() => _ScenarioThreeState();
}

class _ScenarioThreeState extends State<ScenarioThree> {
  bool checkBoxValue = false;
  void changeBoxValue(bool? value) {
    setState(() {
      if (value != null) {
        checkBoxValue = !checkBoxValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scenario Three')),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: Text(
                    textAlign: TextAlign.center,
                    "Some widgets can be hard to understand if users don't get the full picture."),
              ),
              Card(
                  semanticContainer: false,
                  child: Column(
                    children: [
                      PaymentWidget(
                          checkBoxValue: checkBoxValue,
                          onChanged: changeBoxValue),
                      const Divider(),
                      PaymentWidget(
                          checkBoxValue: checkBoxValue,
                          onChanged: changeBoxValue),
                      const Divider(),
                      PaymentWidget(
                          checkBoxValue: checkBoxValue,
                          onChanged: changeBoxValue),
                      const Divider(),
                      PaymentWidget(
                          checkBoxValue: checkBoxValue,
                          onChanged: changeBoxValue),
                    ],
                  )),
            ],
          )),
    );
  }
}

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({
    super.key,
    required this.checkBoxValue,
    required this.onChanged,
  });

  final bool checkBoxValue;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: checkBoxValue, onChanged: onChanged),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              Text("Account"),
              // description
              Text("Account number: 1337"),
            ],
          ),
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // total sum
              Text("1000 SEK"),
              // savings goal progress
              SizedBox(
                width: 50,
                child: LinearProgressIndicator(
                  value: 0.7, // 70% progress
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  minHeight: 10.0, // Minimum height of the line
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
