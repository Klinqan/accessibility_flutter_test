import 'package:accessibility_flutter_test/scenarios/scenario_four.dart';
import 'package:accessibility_flutter_test/scenarios/scenario_one.dart';
import 'package:accessibility_flutter_test/scenarios/scenario_three.dart';
import 'package:accessibility_flutter_test/scenarios/scenario_two.dart';
import 'package:accessibility_flutter_test/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accessibility Workshop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Accessibility Workshop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  final List<dynamic> scenarios = [
    const ScenarioOne(),
    const ScenarioTwo(),
    const ScenarioThree(),
    const ScenarioFour(),
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Preparation for the custom semantics actions
  Color textColor = Colors.white;
  final redColor = const CustomSemanticsAction(label: 'Red Color');
  final blueColor = const CustomSemanticsAction(label: 'Blue Color');
  final whiteColor = const CustomSemanticsAction(label: 'White Color');
  void changeColor(Color color) {
    setState(() {
      textColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Semantics(
            // excluding the title from the semantics tree
            excludeSemantics: true,
            child: Text(widget.title),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Semantics(
                  // adding custom actions
                  customSemanticsActions: {
                    redColor: () => changeColor(Colors.red),
                    blueColor: () => changeColor(Colors.blue),
                    whiteColor: () => changeColor(Colors.white),
                  },
                  child: CustomButton(
                      ontap: () => changeColor(Colors.red),
                      title: "Try activate me",
                      textColor: textColor),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32),
                child: Semantics(
                  // adding label for the image and excluding it from the semantics tree
                  label: "App Shack logo",
                  image: true,
                  excludeSemantics: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(child: Image.asset('assets/appshacklogo.png')),
                      const Text("App Shack super cool logo"),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < widget.scenarios.length; i = i + 2)
                    Column(
                      children: [
                        Semantics(
                          // adding sort key for the scenarios
                          sortKey: OrdinalSortKey(i.toDouble()),
                          button: true,
                          child: CustomButton(
                            title: 'Scenario ${i + 1}',
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          widget.scenarios[i]));
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Semantics(
                          sortKey: OrdinalSortKey(i.toDouble()),
                          button: true,
                          child: CustomButton(
                            title: 'Scenario ${i + 2}',
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          widget.scenarios[i + 1]));
                            },
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ],
          ),
        ));
  }
}
