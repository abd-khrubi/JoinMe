import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/campus.dart';

class ChooseActivityScreen extends StatelessWidget {
  Campus currentCampus;

  ChooseActivityScreen(this.currentCampus);

  var activities = [
    "Basketball",
    "Chess",
    "Cycling",
    "Working out",
    "Running",
    "skipping rope",
    "Swimming"
  ];
  var images = [
    "assets/images/basketball.png",
    "assets/images/chess-pieces.png",
    "assets/images/cycling.png",
    "assets/images/dumbell.png",
    "assets/images/shoes.png",
    "assets/images/skipping-rope.png",
    "assets/images/swimming.png"
  ];

  void _buttonPress(
    Campus child,
  ) {
    //todo go to server
  }

  Widget _activityList() {
    return GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: activities.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: null,
                  child: Image.asset(images[index]),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    fixedSize:
                        MaterialStateProperty.all<Size>(Size.fromWidth(200.0)),
                  )));
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose an Activity"),
      ),
      body: _activityList(),
    );
  }
}
