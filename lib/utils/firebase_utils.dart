import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/activity.dart';
import 'package:flutter_app/models/campus.dart';
import 'package:flutter_app/models/request.dart';
import 'package:flutter_app/services/request_service.dart';

import '../main.dart';
import '../models/app_user.dart';
import '../services/user_service.dart';

var _userService = locator<UserService>();
var _requestService = locator<RequestService>();

Future<AppUser> getUserByUid(String uid) {
  return _userService.getUser(uid);
}

Future<AppUser> saveUser(AppUser user) async {
  return _userService.saveUser(user);
}

Future<AppUser?> login(String email, String pass) async {
  try {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      _userService.currentUserUid = value.user!.uid;
      return _userService.getUser(value.user!.uid);
    });
  } on FirebaseAuthException catch (e) {
    print('Authentication Failed: $e');
  } catch (e) {
    print(e);
  }
  return null;
}

AppUser getCurrentUser() {
  if (_userService.currentUserUid != null) {
    return _userService.getCurrentUser();
  } else if (FirebaseAuth.instance.currentUser != null) {
    final User? currUser = FirebaseAuth.instance.currentUser;
    final uid = currUser!.uid;
    return _userService.getCachedUser(uid);
  }
  throw Exception('No User session');
}

Future<AppUser?> register(String name, String email, String password) async {
  try {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async => await saveUser(AppUser(
            value.user!.uid, email, name, '', '', <Campus>{}, <Activity>{})));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('Password too weak');
    } else if (e.code == 'email-already-in-use') {
      print('Email already in use');
    } else {
      print(e.code);
    }
  } catch (e) {
    print(e);
  }
  return null;
}

Future<void> saveRequest(Request req) {
  return _requestService.saveRequest(req);
}

Request getRequestByUid(String uid) {
  if (uid == null || _requestService.cache[uid] == null) {
    return Request(
        "3da59640-b9ea-11eb-bb67-c55455c42e61",
        "OV4FtZiJZDhjMUnLoFKU6DlVNl82",
        Activity.basketball,
        Campus.rahovot,
        DateTime.now(),
        DateTime.now());
  }
  return _requestService.cache[uid]!;
}
