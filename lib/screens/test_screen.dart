
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_app/screens/google_map_screen.dart';
import 'package:flutter_app/services/user_service.dart';

import '../main.dart';

class TestScreen extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController _nameTextFieldController =
      TextEditingController();

  Future _pressedButton() async {

    CollectionReference testCollection = firestore.collection('test');

    var username = (_nameTextFieldController.text != "")
        ? _nameTextFieldController.text
        : "hello";

    await testCollection.doc(username).set({
      'Hello': 'This is a test',
      'Testing what': 'Testing firestore'
    }).then((value) {
      print("Done");
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "Helloooo!",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "hello",
                ),
                controller: _nameTextFieldController,
              ),
              ElevatedButton(
                onPressed: () {  },
                child: Text("Say hi to firebase!"),
                // onPressed: () => Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (_) => GoogleMapScreen())),
                // onPressed: _pressedButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
