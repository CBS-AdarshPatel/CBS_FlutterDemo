import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

class StapperScreen extends StatefulWidget {
  const StapperScreen({super.key});

  @override
  State<StapperScreen> createState() => _StapperScreenState();
}

class _StapperScreenState extends State<StapperScreen> {
  int activeStep = 0; // Track the current step index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EasyStepper(
              activeStep: activeStep,
              direction: Axis.horizontal, // Display steps in a single line
              stepRadius: 15, // Size of each step
              activeStepBackgroundColor: Colors.green,
              showStepBorder: true, // Display borders around the steps
              //stepBorderColor: Colors.grey, // Border color for inactive steps
              activeStepBorderColor: Colors.red, // Border color for the active step
              steps: [
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 8,
                    backgroundColor:
                    activeStep >= 0 ? Colors.red : Colors.grey, // Outer
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor:
                      activeStep >= 0 ? Colors.orange : Colors.grey, // Inner
                    ),
                  ),
                  title: 'Waiting',
                ),
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 8,
                    backgroundColor:
                    activeStep >= 1 ? Colors.red : Colors.grey, // Outer
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor:
                      activeStep >= 1 ? Colors.orange : Colors.grey, // Inner
                    ),
                  ),
                  title: 'Order Received',
                ),
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 8,
                    backgroundColor:
                    activeStep >= 2 ? Colors.red : Colors.grey, // Outer
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor:
                      activeStep >= 2 ? Colors.orange : Colors.grey, // Inner
                    ),
                  ),
                  title: 'Preparing',
                ),
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 8,
                    backgroundColor:
                    activeStep >= 3 ? Colors.red : Colors.grey, // Outer
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor:
                      activeStep >= 3 ? Colors.orange : Colors.grey, // Inner
                    ),
                  ),
                  title: 'On Way',
                ),
                EasyStep(
                  customStep: CircleAvatar(
                    radius: 8,
                    backgroundColor:
                    activeStep >= 4 ? Colors.red : Colors.grey, // Outer
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor:
                      activeStep >= 4 ? Colors.orange : Colors.grey, // Inner
                    ),
                  ),
                  title: 'Delivered',
                ),
              ],
              onStepReached: (index) {
                setState(() {
                  activeStep = index;
                });
                debugPrint('Active Step: $activeStep');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (activeStep < 4) {
                  setState(() {
                    activeStep++;
                  });
                }
              },
              child: const Text('Next Step'),
            ),
            ElevatedButton(
              onPressed: () {
                if (activeStep > 0) {
                  setState(() {
                    activeStep--;
                  });
                }
              },
              child: const Text('Previous Step'),
            ),
          ],
        ),
      ),
    );
  }
}
