import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:stepper_a/stepper_a.dart';

class AdvanceSwitch extends StatefulWidget {
  const AdvanceSwitch({super.key});

  @override
  State<AdvanceSwitch> createState() => _AdvanceSwitchState();
}

class _AdvanceSwitchState extends State<AdvanceSwitch> {
  final StepperAController controller = StepperAController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Switch Example'),
      ),
      body: Center(
        child: StepperA(
          stepperSize: const Size(300, 90),
          borderShape: BorderShape.rRect,
          borderType: BorderType.straight,
          stepperAxis: Axis.horizontal,
          lineType: LineType.dotted,
          stepperBackgroundColor: Colors.transparent,
          stepperAController: controller,
          stepHeight: 40,
          stepWidth: 40,
          stepBorder: true,
          pageSwipe: false,
          formValidation: true,
          previousButton: (int index) => StepperAButton(
            width: 90,
            height: 40,
            onTap: (int currentIndex) {
              // Handle back button logic
            },
            buttonWidget: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          forwardButton: (int index) => StepperAButton(
            width: index == 0 ? 200 : 90,
            height: 40,
            onTap: (int currentIndex) {
              // Handle forward button logic
            },
            onComplete: () {
              debugPrint("Forward Button click complete step call back!");
            },
            buttonWidget: index == 3
                ? const Text('Complete', style: TextStyle(fontSize: 14, color: Colors.white))
                : const Text('Next', style: TextStyle(fontSize: 14, color: Colors.white)),
          ),
          customSteps: [
            const CustomSteps(stepsIcon: Icons.login, title: "LogIn"),
            const CustomSteps(stepsIcon: Icons.home, title: "Home"),
            const CustomSteps(stepsIcon: Icons.account_circle, title: "Account"),
            CustomSteps(
              image: Image.asset(
                "lib/assets/builders_images.jpg",
                color: Colors.white,
              ),
              title: "Payment",
            ),
          ],
          step: const StepA(
            currentStepColor: Colors.green,
            completeStepColor: Colors.indigo,
            inactiveStepColor: Colors.black45,
            margin: EdgeInsets.all(5),
          ),
          stepperBodyWidget: [
            StepOne(controller: controller),
            StepTwo(controller: controller),
            StepThree(controller: controller),
            StepFour(controller: controller),
          ],
        ),
      ),
    );
  }
}

class StepOne extends StatelessWidget {
  final StepperAController controller;

  const StepOne({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Step One Content'),
    );
  }
}

class StepTwo extends StatelessWidget {
  final StepperAController controller;

  const StepTwo({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Step Two Content'),
    );
  }
}

class StepThree extends StatelessWidget {
  final StepperAController controller;

  const StepThree({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Step Three Content'),
    );
  }
}

class StepFour extends StatelessWidget {
  final StepperAController controller;

  const StepFour({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Step Four Content'),
    );
  }
}
