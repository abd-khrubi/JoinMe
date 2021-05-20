import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/screens/HomePage.dart';
import '../models/campus.dart';
import '../models/activity.dart';

import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/models/app_user.dart';


class ProfilePage extends StatefulWidget {
  final AppUser user;

  const ProfilePage(this.user);


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> campusList = ["Givat Ram", "MT.Scopus", "Ein Karem", "Rehovot"];
  List<bool> tapped = [false, false, false, false];
  List<bool> tappedSport = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  bool prefersGivatRam = false;
  bool prefersMountScopus = false;
  bool prefersRehovot = false;
  bool prefersEinKarem = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile Page ${widget.user.username}",
            style: TextStyle(fontSize: 18.0),
          ),
        ),

      ),
      backgroundColor: Colors.white,
      body: ListView(
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
          ListTile(
            contentPadding: EdgeInsets.only(left: 30),
            title: Text("Preferred campuses:"),
            leading: Icon(Icons.home_work_outlined),
          ),
          GridView.builder(
            padding: EdgeInsets.only(bottom: 20),
            shrinkWrap: true,
            itemCount: campusList.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: ChoiceChip(
                  label: Text(campusList[index]),
                  labelStyle: TextStyle(color: Colors.white),
                  selectedColor: Colors.blue,
                  selected: tapped[index],
                  onSelected: (bool selected) {
                    setState(() {
                      tapped[index] = !tapped[index];
                      if (tapped[index]) {
                        widget.user.preferredCampuses
                            .add(stringToCampus(campusList[index]));
                      } else {
                        widget.user.preferredCampuses
                            .remove(stringToCampus(campusList[index]));
                      }
                    });
                  },
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 4),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 30),
            title: Text("Preferred sports:"),
            leading: Icon(Icons.sports_handball_outlined),
          ),
          GridView.builder(
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.only(bottom: 20),
            shrinkWrap: true,
            itemCount: Activity.values.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: ChoiceChip(
                  visualDensity: VisualDensity(),
                  labelPadding: EdgeInsets.symmetric(),
                  label: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(activityToString(Activity.values[index]))),
                  labelStyle: TextStyle(color: Colors.white),
                  selectedColor: Colors.blue,
                  selected: tappedSport[index],
                  avatar: CircleAvatar(
                    backgroundImage:
                        Image.asset(activityImagePath(Activity.values[index]))
                            .image,
                  ),
                  onSelected: (bool selected) {
                    setState(() {
                      tappedSport[index] = !tappedSport[index];
                      if (tappedSport[index]) {
                        widget.user.favoriteSports.add(Activity.values[index]);
                      } else {
                        widget.user.favoriteSports
                            .remove(Activity.values[index]);
                      }
                    });
                  },
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 2.5),
          ),
          IconButton(
              alignment: Alignment.bottomCenter,
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(widget.user)));
              },
              icon: Icon(Icons.home_outlined),iconSize: 35.0,)
        ],
      ),
    );

  }
}
