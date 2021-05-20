import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/user.dart';

class UserService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _collectionName = 'users';
  late CollectionReference<AppUser> _ref;

  Map<String, AppUser> _cache = <String, AppUser>{};
  String? currentUserUid;

  UserService() {
    _ref = _db.collection(_collectionName).withConverter(
        fromFirestore: (snapshots, _) => AppUser.fromJson(snapshots.data()!),
        toFirestore: (user, _) => user.toJson());
  }

  AppUser getCachedUser(String uid) {
    return _cache[uid]!;
  }

  AppUser getCurrentUser() {
    return _cache[currentUserUid]!;
  }

  Future<AppUser> getUser(String uid) async {
    return _ref.doc(uid).get().then((snapshot) {
      if (snapshot.exists) {
        AppUser usr = snapshot.data() as AppUser;
        return usr;
      } else {
        throw FuckYouException();
      }
    });
  }

  Future<AppUser> saveUser(AppUser user) async {
    return _ref.doc(user.uid).set(user).then((value) => user);
  }
}

class FuckYouException extends FormatException {}
