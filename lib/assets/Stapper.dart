import 'package:flutter/material.dart';

class Stapper extends StatefulWidget {
  const Stapper({super.key});

  @override
  State<Stapper> createState() => _StapperState();
}

class _StapperState extends State<Stapper> {
  int _currentStep = 0;

  // Define text controllers for the text fields
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  // Define a list of steps
  List<Step> stepList() => [
    Step(
      title: const SizedBox.shrink(),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Owner Details', // The bold "Owner" text
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controller1,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _controller2,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      isActive: _currentStep >= 0,
    ),
    Step(
      title: const SizedBox.shrink(),
      content: const SizedBox.shrink(),
      isActive: _currentStep >= 1,
    ),
    Step(
      title: const SizedBox.shrink(),
      content: const SizedBox.shrink(),
      isActive: _currentStep >= 2,
    ),
    Step(
      title: const SizedBox.shrink(),
      content: const SizedBox.shrink(),
      isActive: _currentStep >= 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'Stepper Example',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              type: StepperType.horizontal,
              steps: stepList(),
              currentStep: _currentStep,
              onStepTapped: (step) {
                setState(() {
                  _currentStep = step;
                });
              },
              onStepContinue: () {
                if (_currentStep < stepList().length - 1) {
                  setState(() {
                    _currentStep += 1;
                  });
                }
              },
              onStepCancel: () {
                if (_currentStep > 0) {
                  setState(() {
                    _currentStep -= 1;
                  });
                }
              },
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                // You can return an empty container here to hide default controls
                return const SizedBox.shrink();
              },
            ),
          ),
          // Custom control buttons at the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Previous button (disabled when at first step)
                if (_currentStep > 0)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _currentStep -= 1;
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red, // Set background color
                      foregroundColor: Colors.white, // Set text color
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    ),
                    child: const Text('Previous'),
                  ),
                // Next button (disabled when at last step)
                if (_currentStep < stepList().length - 1)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _currentStep += 1;
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green, // Set background color
                      foregroundColor: Colors.white, // Set text color
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    ),
                    child: const Text('Next'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
