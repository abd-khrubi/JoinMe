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
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: null,
                    child: Image.asset(
                      images[index],
                      height: 100,
                      width: 50,
                      scale: 10,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      fixedSize: MaterialStateProperty.all<Size>(
                          Size.fromWidth(200.0)),
                      shadowColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                  ),
                ),
                Text(activities[index]),
              ],
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1));
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
