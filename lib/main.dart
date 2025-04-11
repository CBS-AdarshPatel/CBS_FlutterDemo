import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:hreyeflutterdemo/CreateForm.dart';
import 'package:hreyeflutterdemo/DateFormate.dart';
import 'package:hreyeflutterdemo/GenericStepper.dart';
import 'package:hreyeflutterdemo/LineChartScreen.dart';
import 'package:hreyeflutterdemo/OrgChartScreen.dart';
import 'package:hreyeflutterdemo/PieChartScreen.dart';
import 'package:hreyeflutterdemo/StapperScreen.dart';
import 'package:hreyeflutterdemo/Toggle.dart';
import 'package:hreyeflutterdemo/assets/AnimatedToggle.dart';
import 'package:hreyeflutterdemo/assets/Stapper.dart';
import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  // Dynamically generated steps
  final List<Step> steps = List.generate(
    4,
        (index) => Step(
      title: Text("Step ${index + 1}"),
      content: Text("Content for Step ${index + 1}"),
      isActive: true,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20, // Adjust size as needed
              backgroundImage: AssetImage('asset/images/profile.jpg'), // Path to your image
            ),
            SizedBox(width: 20), // Add some spacing
            Text("Login Page"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                /*child: Container(
                    width: 200,
                    height: 150,
                    *//*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*//*
                    child: Image.asset('asset/images/flutter-logo.png')),*/
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            /*ElevatedButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),*/

            Container(
              margin: EdgeInsets.only(top: 20), // Adds a top margin of 10
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Matches the background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AnimatedToggle()),
                      //MaterialPageRoute(builder: (_) => Toggle()),
                      //MaterialPageRoute(builder: (_) => Stapper()),
                      /*MaterialPageRoute(builder: (_) => const GenericStepper(
                        appBarTitle: 'Custom Stepper',
                        appBarColor: Colors.green,
                        steps: [
                          Step(
                            title: const SizedBox.shrink(),
                            content: const SizedBox.shrink(),
                            isActive: true,
                          ),
                          Step(
                            title: const SizedBox.shrink(),
                            content: const SizedBox.shrink(),
                            isActive: true,
                          ),
                          Step(
                            title: const SizedBox.shrink(),
                            content: const SizedBox.shrink(),
                            isActive: true,
                          ),
                          Step(
                            title: const SizedBox.shrink(),
                            content: const SizedBox.shrink(),
                            isActive: true,
                          ),
                        ],
                        nextButtonColor: Colors.blue,
                        previousButtonColor: Colors.orange,
                      ),
                      ),*/

                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}
