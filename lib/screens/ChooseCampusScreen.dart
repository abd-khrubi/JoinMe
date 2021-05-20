import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/screens/ChooseActivityScreen.dart';

class ChooseCampusScreen extends StatelessWidget {
  Firestore firestore = Firestore.instance;
  var campusList = ["Givat Ram", "MT.Scopus", "Ein Karem", "Rehovot"];

  void campusButtonPressed(BuildContext context, String campus) {
    Campus currentCampus;
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
    print(currentCampus);
  }

  Widget _campusList() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: campusList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(20.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  enableFeedback: true,
                ),
                onPressed: () =>
                    {campusButtonPressed(context, campusList[index])},
                child: Text(campusList[index])),
          );
        });
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
