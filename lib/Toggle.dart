import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Toggle extends StatefulWidget {
  const Toggle({super.key});

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  // Define the isChecked variable to hold the toggle state
  bool isChecked = false;
  bool _giftwrapping = false;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
              style: const TextStyle(
                color: Color(0xff000000),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.4,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 98, top: 20),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      ),
    );
  }
}
