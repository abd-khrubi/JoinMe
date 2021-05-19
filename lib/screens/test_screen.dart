import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestScreen extends StatelessWidget {
  Firestore firestore = Firestore.instance;
  TextEditingController _nameTextFieldController = TextEditingController();

  Future _pressedButton() async {
    CollectionReference testCollection = firestore.collection('test');

    var username = (_nameTextFieldController.text != "") ? _nameTextFieldController.text : "hello";

    await testCollection.document(username).setData({
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
              RaisedButton(
                child: Text("Say hi to firebase!"),
                onPressed: _pressedButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
