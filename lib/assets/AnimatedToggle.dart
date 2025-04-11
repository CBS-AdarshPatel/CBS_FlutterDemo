import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:hreyeflutterdemo/AdvanceSwitch.dart';
import 'package:hreyeflutterdemo/CreateForm.dart';
import 'package:hreyeflutterdemo/StapperScreen.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../TripleToggleSwitch.dart';

class AnimatedToggle extends StatefulWidget {
  const AnimatedToggle({super.key});

  @override
  State<AnimatedToggle> createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  int value = 0;

  // Method to dynamically set indicator colors
  Color colorBuilder(int index) {
    switch (index) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.green;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  // Method to create icons for each toggle option
  Widget iconBuilder(int index, Size size, bool active) {
    final texts = ['Home', 'Work', 'School', 'Settings'];
    return Text(
      texts[index],
      style: TextStyle(
        fontSize: size.height * 0.3,
        fontWeight: FontWeight.bold,
        color: active ? Colors.white : Colors.black54,
      ),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Toggle & Rolling Switch')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated Toggle Switch
          AnimatedToggleSwitch<int>.size(
            textDirection: TextDirection.rtl,
            current: value,
            values: const [0, 1, 2, 3],
            iconOpacity: 0.2,
            indicatorSize: const Size(120, 50), // Adjust size for better fit
            borderWidth: 4.0,
            iconAnimationType: AnimationType.onHover,
            style: ToggleStyle(
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1.5),
                ),
              ],
            ),
            styleBuilder: (i) => ToggleStyle(indicatorColor: colorBuilder(i)),
            onChanged: (i) {
              setState(() => value = i);
              if (i == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  RollingSwitchExample()),
                );
              }
              if (i == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StapperScreen()),
                );
              }
              if (i == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdvanceSwitch()),
                );
              }
              if (i == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateForm()),
                );
              }
            },
          ),
          const SizedBox(height: 30),

          // Lite Rolling Switch
          LiteRollingSwitch(
            value: true,
            textOn: 'Android',
            textOff: 'iOS',
            colorOn: Colors.greenAccent,
            colorOff: Colors.redAccent,
            iconOn: Icons.done,
            iconOff: Icons.remove_circle_outline,
            /*iconOn: Image.asset(
              'lib/assets/builders_images.jpg',
              width: 24,
              height: 24,
            ),
            iconOff: Image.asset(
              'lib/assets/builders_images.jpg', // Replace with your image path
              width: 24, // Adjust the size as needed
              height: 24,
            ),*/
            textSize: 16.0,
            onTap: () {
              print('Switch tapped!');
            },
            onDoubleTap: () {
              print('Switch double-tapped!');
            },
            onSwipe: () {
              print('Switch swiped!');
            },
            onChanged: (bool state) {
              print('Switch is now: ${state ? "On" : "Off"}');
            },
          ),
        ],
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: AnimatedToggle()));
