import 'package:flutter/material.dart';
import 'package:hreyeflutterdemo/GenericStepper.dart';

class GenericStepper extends StatefulWidget {
  final List<Step> steps;
  final String title;
  final Color appBarColor;
  final Color activeStepColor;
  final VoidCallback? onFinish;

  const GenericStepper({
    super.key,
    required this.steps,
    this.title = "Stepper Example",
    this.appBarColor = Colors.green,
    this.activeStepColor = Colors.orange,
    this.onFinish, required String appBarTitle, required MaterialColor nextButtonColor, required MaterialColor previousButtonColor,
  });

  @override
  State<GenericStepper> createState() => _GenericStepperState();
}

class _GenericStepperState extends State<GenericStepper> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: widget.appBarColor,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              type: StepperType.horizontal,
              steps: widget.steps,
              currentStep: _currentStep,
              onStepTapped: (step) {
                setState(() {
                  _currentStep = step;
                });
              },
              onStepContinue: () {
                if (_currentStep < widget.steps.length - 1) {
                  setState(() {
                    _currentStep += 1;
                  });
                } else if (widget.onFinish != null) {
                  widget.onFinish!();
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
                return const SizedBox.shrink();
              },
            ),
          ),
          // Custom control buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Previous button (disabled when at the first step)
                if (_currentStep > 0)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _currentStep -= 1;
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    ),
                    child: const Text('Previous'),
                  ),
                // Next or Finish button
                TextButton(
                  onPressed: () {
                    if (_currentStep < widget.steps.length - 1) {
                      setState(() {
                        _currentStep += 1;
                      });
                    } else if (widget.onFinish != null) {
                      widget.onFinish!();
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: _currentStep == widget.steps.length - 1
                        ? Colors.blue
                        : Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  ),
                  child: Text(
                    _currentStep == widget.steps.length - 1 ? 'Finish' : 'Next',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
