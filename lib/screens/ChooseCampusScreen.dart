import 'package:flutter/material.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/screens/ChooseActivityScreen.dart';

class ChooseCampusScreen extends StatelessWidget {
  final List<String> campusList = [
    "Givat Ram",
    "MT.Scopus",
    "Ein Karem",
    "Rehovot"
  ];

  void campusButtonPressed(BuildContext context, String campus) {
    Campus currentCampus = Campus.givat;
    switch (campus) {
      case "Givat Ram":
        {
          currentCampus = Campus.givat;
        }
        break;
      case "Ein Karem":
        {
          currentCampus = Campus.ein_karem;
        }
        break;
      case "MT.Scopus":
        {
          currentCampus = Campus.har;
        }
        break;
      case "Rehovot":
        {
          currentCampus = Campus.rahovot;
        }
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChooseActivityScreen(currentCampus)));
  }

  Widget _campusList() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: campusList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all<Color>(Colors.black),
              elevation: MaterialStateProperty.all(10.0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              enableFeedback: true,
            ),
            onPressed: () => {campusButtonPressed(context, campusList[index])},
            child: Text(
              campusList[index],
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a campus"),
      ),
      body: _campusList(),
    );
  }
}
