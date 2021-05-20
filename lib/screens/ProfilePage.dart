import 'package:flutter/material.dart';
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
                title: Text(widget.user.username!),
                leading: Icon(Icons.person),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 30),
                title: Text(widget.user.email!),
                leading: Icon(Icons.email),
              ),
              SizedBox(height: 30),
              Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text("Preferred campuses:",
                      style: TextStyle(fontSize: 18))),

              Container(
                  padding: EdgeInsets.only(left: 25),
                  child: Wrap(
                    children: [
                      ChoiceChip(
                        label: Text("Givat Ram"),
                        selected: prefersGivatRam,
                        backgroundColor: Colors.black54,
                        labelStyle: TextStyle(color: Colors.white),
                        selectedColor: Colors.blue,
                        // avatar: CircleAvatar(
                        //   backgroundImage:
                        //       Image.asset("assets/images/KK_(125).jpg").image,),
                        onSelected: (bool selected) {
                          setState(() {
                            prefersGivatRam = !prefersGivatRam;
                            if (prefersGivatRam) {
                              widget.user.preferredCampuses.add(Campus.givat);
                            } else {
                              widget.user.preferredCampuses.remove(Campus.givat);
                            }
                            print(widget.user.preferredCampuses); //todo: delete
                          });
                        },
                      ),
                      ChoiceChip(
                        label: Text("Mount Scopus"),
                        selected: prefersMountScopus,
                        backgroundColor: Colors.black54,
                        labelStyle: TextStyle(color: Colors.white),
                        selectedColor: Colors.blue,
                        onSelected: (bool selected) {
                          setState(() {
                            prefersMountScopus = !prefersMountScopus;
                            if (prefersMountScopus) {
                              widget.user.preferredCampuses.add(Campus.har);
                            } else {
                              widget.user.preferredCampuses.remove(Campus.har);
                            }
                            print(widget.user.preferredCampuses); //todo: delete
                          });
                        },
                      ),
                      ChoiceChip(
                        label: Text("Rehovot"),
                        selected: prefersRehovot,
                        backgroundColor: Colors.black54,
                        labelStyle: TextStyle(color: Colors.white),
                        selectedColor: Colors.blue,
                        onSelected: (bool selected) {
                          setState(() {
                            prefersRehovot = !prefersRehovot;
                            if (prefersRehovot) {
                              widget.user.preferredCampuses.add(Campus.rahovot);
                            } else {
                              widget.user.preferredCampuses
                                  .remove(Campus.rahovot);
                            }
                            print(widget.user.preferredCampuses); //todo: delete
                          });
                        },
                      ),
                      ChoiceChip(
                        label: Text("Ein Karem"),
                        selected: prefersEinKarem,
                        backgroundColor: Colors.black54,
                        labelStyle: TextStyle(color: Colors.white),
                        selectedColor: Colors.blue,
                        onSelected: (bool selected) {
                          setState(() {
                            prefersEinKarem = !prefersEinKarem;
                            if (prefersEinKarem) {
                              widget.user.preferredCampuses
                                  .add(Campus.ein_karem);
                            } else {
                              widget.user.preferredCampuses
                                  .remove(Campus.ein_karem);
                            }
                            print(widget.user.preferredCampuses); //todo: delete
                          });
                        },
                      )
                    ],
                  ))

            ],
          ),
        )));
  }
}
