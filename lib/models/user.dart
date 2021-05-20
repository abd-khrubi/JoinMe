import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/models/activity.dart';

class User {
  String uid;
  String email;
  String username;
  String phoneNumber;
  String imageUid;

  Set<Campus> preferredCampuses;
  Set<Activity> favoriteSports;

  User(this.uid, this.email, this.username, this.preferredCampuses,
      this.favoriteSports);

}
