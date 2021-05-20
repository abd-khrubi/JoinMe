import 'package:flutter/material.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/models/user.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({Key key, this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  List<String> campusList = ["Givat Ram", "MT.Scopus", "Ein Karem", "Rehovot"];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Page ${widget.user.username}",
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              CircleAvatar(radius: 40, child: Icon(Icons.person)),
              SizedBox(
                height: 30,
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 30),
                title: Text(widget.user.username),
                leading: Icon(Icons.person),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 30),
                title: Text(widget.user.email),
                leading: Icon(Icons.email),
              ),
              SizedBox(height: 30),
              Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text("Preferred campuses:",
                      style: TextStyle(fontSize: 18))),
              ChoiceChip(label: Text("Givat Ram"),
                selected: false,
                onSelected:(bool selected){

                },)
            ],
          ),
        ),
      ),
    );
  }
}

