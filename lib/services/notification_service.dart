import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/user_notification.dart';

class NotificationService {

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _collectionName = 'notification';
  late CollectionReference<UserNotification> _ref;

  Map<String, UserNotification> _cache = <String, UserNotification>{};

  NotificationService() {
    _ref = _db.collection(_collectionName).withConverter(
        fromFirestore: (snapshots, _) =>
            UserNotification.fromJson(snapshots.data()!),
        toFirestore: (req, _) => req.toJson());
  }

  List<UserNotification> getCachedNotifications() {
    return _cache.values.toList();
  }

  Future<List<UserNotification>> loadNotifications() async {
    await _ref.get().then((value) {
        value.docs.forEach((element) {
          var req = element.data();
          req.uid = element.id;
          _cache[element.id] = req;
        });
        return getCachedNotifications();
    });
    return getCachedNotifications();
  }

  Future<void> saveRequest(UserNotification notification) async {
    return _ref.doc(notification.uid!).set(notification);
  }
}