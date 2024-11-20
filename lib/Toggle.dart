import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
//import 'package:custom_switch_button/custom_switch_button.dart';

class Toggle extends StatefulWidget {
  const Toggle({super.key});


  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  // Define the isChecked variable to hold the toggle state
  bool isChecked = false;
  bool _giftwrapping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Switch Condition")),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20), // Add top padding here
              child: Text(
                'Gift Wrapping',
                style: TextStyle(
                  color: const Color(0xff000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.4,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 98,top: 20),
              child: Transform.scale(
                scale: 1,
                child: CupertinoSwitch(
                  value: _giftwrapping,
                  thumbColor: const Color(0xffffffff),
                  activeColor: const Color(0xff6939ed),
                  onChanged: (value) {
                    setState(() {
                      _giftwrapping = value;
                    });
                  },
                ),
              ),
            ),
            Visibility(
              visible: _giftwrapping,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                height: 100,
                color: const Color(0xff6939ed),
                child: const Center(
                  child: Text(
                    "Switch turned on",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
