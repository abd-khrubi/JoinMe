import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

@JsonSerializable(nullable: true)
class AppUser {
  String? uid;
  String? email;
  String? username;
  String? phoneNumber;
  String? imageUid;

  Set<Campus> preferredCampuses;
  Set<Activity> favoriteSports;

  AppUser(this.uid, this.email, this.username, this.phoneNumber, this.imageUid,
      this.preferredCampuses, this.favoriteSports);

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);

  // User(this.uid, this.email, this.username, this.preferredCampuses,
  //     this.favoriteSports);

  @Deprecated('use AppUser.fromJson')
  static AppUser? fromDocument(String uid, DocumentSnapshot<AppUser> doc) {
    log("Got user: " + doc.data.toString());
    return null;
    // return User(uid, doc.data['email'], '', doc.data['phoneNumber'],
    //     doc.data['imageUid'], <Campus>[], <Activity>[] // TODO campus/activity lists
    //     );
  } // TODO read user from document data

  @Deprecated('use toJson')
  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'imageUid': this.imageUid,
      'phoneNumber': this.phoneNumber,
      'username': this.username,
      'preferredCampuses':
          this.preferredCampuses.map((e) => e.toString()).toList(),
      'favoriteSports': this.favoriteSports.map((e) => e.toString()).toList()
    };
  }

  @override
  String toString() {
    return 'User{uid: $uid, email: $email, username: $username, phoneNumber: $phoneNumber, imageUid: $imageUid, preferredCampuses: $preferredCampuses, favoriteSports: $favoriteSports}';
  }
}
