import 'package:flutter/material.dart';
import 'package:org_chart/org_chart.dart';
class OrgChartScreen extends StatefulWidget {
  const OrgChartScreen({super.key});

  @override
  State<OrgChartScreen> createState() => _OrgChartScreenState();
}

class _OrgChartScreenState extends State<OrgChartScreen> {
  final OrgChartController<Map> orgChartController = OrgChartController<Map>(
    boxSize: const Size(160, 180),
    items: [
      {
        "id": "0",
        "text": "Naman Agarwal \nAssoc Dir",
        "text1": "naman.agarwal@cogniscient.in",
        "image": "lib/assets/builders_images.jpg", // Update with your image path
      },
      {
        "id": '1',
        "text": 'Farhan \nDeveloper',
        "text1": "farhan.khan@cogniscient.in",
        "to": '0',
        "image": "lib/assets/builders1_images.jpg", // Update with your image path
      },
      {
        "id": '2',
        "text": 'Adarsh \nMobile Dev',
        "text1": "adarsh.patel@cogniscient.in",
        "to": '0',
        "image": "lib/assets/builders2_images.jpg", // Update with your image path
      },
      {
        "id": '3',
        "text": 'Shubhranshu \nDev',
        "text1": "shubhranshu.yadav@cogniscient.in",
        "to": '1',
        "image": "lib/assets/builders_images.jpg", // Update with your image path
      },
      {
        "id": '4',
        "text": 'Aditya \nFlutter Dev',
        "text1": "aditya.sah@cogniscient.in",
        "to": '2',
        "image": "lib/assets/builders_images.jpg", // Update with your image path
      },
    ],
    idProvider: (data) => data["id"],
    toProvider: (data) => data["to"],
    toSetter: (data, newID) => data["to"] = newID,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade100,
                Colors.blue.shade200,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Center(
                  child: OrgChart<Map>(
                    cornerRadius: 10,
                    controller: orgChartController,
                    isDraggable: true,
                    linePaint: Paint()
                      ..color = Colors.black
                      ..strokeWidth = 3
                      ..style = PaintingStyle.stroke,
                    onTap: (item) {
                      orgChartController.addItem({
                        "id": orgChartController.uniqueNodeId,
                        "text": 'New Block',
                        "text1": 'New Block1',
                        "to": item["id"],
                        "image": "lib/assets/builders_images.jpg", // Default image
                      });
                      setState(() {});
                    },
                    builder: (details) {
                      return GestureDetector(
                        child: Card(
                          elevation: 5,
                          color: details.isBeingDragged
                              ? Colors.green.shade100
                              : details.isOverlapped
                              ? Colors.red.shade200
                              : Colors.teal.shade50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  details.item["image"],
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                details.item["text"],
                                style: TextStyle(
                                  color: Colors.purple.shade900,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                details.item["text1"],
                                style: TextStyle(
                                  color: Colors.purple.shade900,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    optionsBuilder: (item) {
                      return [
                        const PopupMenuItem(
                          value: 'Remove',
                          child: Text('Remove'),
                        ),
                      ];
                    },
                    onOptionSelect: (item, value) {
                      if (value == 'Remove') {
                        orgChartController.removeItem(
                            item["id"], ActionOnNodeRemoval.unlink);
                      }
                    },
                    onDrop: (dragged, target, isTargetSubnode) {
                      if (isTargetSubnode) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text(
                                  'You cannot drop a node on a subnode'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                        orgChartController.calculatePosition();

                        return;
                      }
                      dragged["to"] = target["id"];
                      orgChartController.calculatePosition();
                    },
                  ),
                ),
                const Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'Tap to add a node, double tap to change text\ndrag and drop to change hierarchy\nright click / tap and hold to remove \nDrag in the empty space to pan the chart, zoom in and out.',
                  ),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              label: const Text('Reset & Change Orientation'),
              onPressed: () {
                orgChartController.switchOrientation();
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<String?> getBlockText(
      BuildContext context, Map<dynamic, dynamic> item) async {
    final String? text = await showDialog(
      context: context,
      builder: (context) {
        String text = item["text"];
        return AlertDialog(
          title: const Text('Enter Text'),
          content: TextFormField(
            initialValue: item["text"],
            onChanged: (value) {
              text = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(text);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
    return text;
  }
}
