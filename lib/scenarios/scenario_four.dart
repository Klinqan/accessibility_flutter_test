import 'package:flutter/material.dart';

class ScenarioFour extends StatefulWidget {
  const ScenarioFour({super.key});

  @override
  State<ScenarioFour> createState() => _ScenarioFourState();
}

class _ScenarioFourState extends State<ScenarioFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Scenario Four')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: Text(
                      textAlign: TextAlign.center,
                      "Some widgets can be hard to understand if users don't get the full picture. Use custom actions to improve."),
                ),
                SizedBox(height: 64),
                ImageWithButtons(
                    image: 'assets/appshacklogo.png',
                    accessibilityDescription: 'appshack logo'),
                ImageWithButtons(
                    image: 'assets/panda.jpg',
                    accessibilityDescription: "panda"),
                // _buildQuestion(),
              ],
            ),
          ),
        ));
  }
}

class ImageWithButtons extends StatefulWidget {
  const ImageWithButtons(
      {required this.accessibilityDescription, required this.image, super.key});
  final String accessibilityDescription;
  final String image;

  @override
  State<ImageWithButtons> createState() => _ImageWithButtonsState();
}

class _ImageWithButtonsState extends State<ImageWithButtons> {
  bool? isLiked;

  void _onLikePressed() {
    setState(() {
      isLiked = true;
    });
  }

  void _onDislikePressed() {
    setState(() {
      isLiked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(widget.image),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _onLikePressed,
                icon: const Icon(Icons.thumb_up, color: Colors.black),
                label: const Text(
                  'Like',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isLiked == true ? Colors.blue : Colors.grey,
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: _onDislikePressed,
                icon: const Icon(Icons.thumb_down, color: Colors.black),
                label: const Text('Dislike',
                    style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isLiked == false ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
