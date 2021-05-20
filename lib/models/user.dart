import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/models/activity.dart';

class User {
  String uid;
  String email;
  String username;
  String phoneNumber;
  String imageUid;

  List<Campus> preferredCampuses;
  List<Activity> favoriteSports;


  User(this.uid, this.email, this.username, this.phoneNumber, this.imageUid,
      this.preferredCampuses, this.favoriteSports);

  // User(this.uid, this.email, this.username, this.preferredCampuses,
  //     this.favoriteSports);

  static User fromDocument(String uid, DocumentSnapshot doc){
    log("Got user: " + doc.data.toString());
    return User(uid, doc.data['email'], '', doc.data['phoneNumber'], doc.data['imageUid'],
    null, null // TODO campus/activity lists
    );
  } // TODO read user from document data

}
