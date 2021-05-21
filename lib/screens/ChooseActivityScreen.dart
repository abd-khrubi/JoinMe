import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/screens/choose_path_screen.dart';
import '../models/activity.dart';

class ChooseActivityScreen extends StatelessWidget {
  Campus currentCampus;

  ChooseActivityScreen(this.currentCampus);

  void _buttonPress(BuildContext context, Campus campus, Activity activity) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChoosePathScreen(activity, campus)),
    );
  }

  Widget _activityList(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        itemCount: Activity.values.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _buttonPress(context, currentCampus, Activity.values[index]);
                    },
                    child: Image.asset(
                      activityImagePath(Activity.values[index]),
                      height: 100,
                      width: 100,
                      scale: 10,
                    ),
                    style: ButtonStyle(
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      elevation: MaterialStateProperty.all(10.0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                  ),
                ),
                Text(activityToString(Activity.values[index])),
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
      body: _activityList(context),
    );
  }
}
