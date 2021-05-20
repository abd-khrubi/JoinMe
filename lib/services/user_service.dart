
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/user.dart';

class UserService {
  final Firestore _db = Firestore.instance;
  final String _collectionName = 'users';
  CollectionReference _ref;

  User _cachedUser;

  UserService() {
    _ref = _db.collection(_collectionName);
  }

  getCachedUser() {
    return _cachedUser;
  }

  Future<User> getUser(String uid) async {
    if (_cachedUser != null) {
      log("Cache hit on user");
      return _cachedUser;
    }
    DocumentSnapshot doc = await _ref.document(uid).get();
    log(doc.toString());

    if (!doc.exists || doc.data == null) {
      log("UserService.getUser(): Empty user document");
      return null;
    }

    _cachedUser = User.fromDocument(uid, doc);
    return _cachedUser;
  }
}