import 'package:flutter/material.dart';


class RollingSwitchExample extends StatefulWidget {
  @override
  _RollingSwitchExampleState createState() => _RollingSwitchExampleState();
}

class _RollingSwitchExampleState extends State<RollingSwitchExample> {
  Alignment _alignment = Alignment.center; // Initial alignment is center

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rolling Switch'),
      ),
      body: Center(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            setState(() {
              // Swipe to change alignment
              if (details.primaryVelocity! > 0) {
                _alignment = Alignment.centerRight; // Swipe right
              } else if (details.primaryVelocity! < 0) {
                _alignment = Alignment.centerLeft; // Swipe left
              }
            });
          },
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                // Rolling circle
                AnimatedAlign(
                  duration: Duration(milliseconds: 300),
                  alignment: _alignment,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: _alignment == Alignment.centerLeft
                            ? Colors.green
                            : _alignment == Alignment.centerRight
                            ? Colors.blue
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                // Labels
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Android',
                      style: TextStyle(
                        color: _alignment == Alignment.centerLeft
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      'iOS',
                      style: TextStyle(
                        color: _alignment == Alignment.centerRight
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
