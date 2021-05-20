import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/user.dart';

class UserService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _collectionName = 'users';
  late CollectionReference<User> _ref;

  // Map<String, User> cache;
  late User _cachedUser;

  UserService() {
    _ref = _db.collection(_collectionName).withConverter(
        fromFirestore: (snapshots, _) => User.fromJson(snapshots.data()!),
        toFirestore: (user, _) => user.toJson());
    // _ref = _db.collection(_collectionName);
  }

  getCachedUser() {
    return _cachedUser;
  }

  Future<User> getUser(String uid) async {
    // CollectionReference _ref = _db.collection('users');
    CollectionReference _ref = _db.collection(_collectionName)
    .withConverter(
        fromFirestore: (snapshots, _) => User.fromJson(snapshots.data()!),
        toFirestore: (user, _) => (user as User).toJson());

    return _ref.doc(uid).get().then((snapshot) {
      if (snapshot.exists) {
        User usr = snapshot.data() as User;
        return usr;
      } else {
        throw FuckYouException();
      }
    });
  }
}

class FuckYouException extends FormatException {}
