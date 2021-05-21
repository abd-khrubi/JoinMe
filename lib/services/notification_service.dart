import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/notification.dart';

class NotificationService {

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _collectionName = 'notification';
  late CollectionReference<Notification> _ref;

  Map<String, Notification> _cache = <String, Notification>{};

  NotificationService() {
    _ref = _db.collection(_collectionName).withConverter(
        fromFirestore: (snapshots, _) =>
            Notification.fromJson(snapshots.data()!),
        toFirestore: (req, _) => req.toJson());
  }

  List<Notification> getCachedNotifications() {
    return _cache.values.toList();
  }

  Future<List<Notification>> loadNotifications() async {
    _ref.get().then((value) {
        value.docs.forEach((element) {
          var req = element.data();
          req.uid = element.id;
          _cache[element.id] = req;
        });
        return getCachedNotifications();
    });
    return getCachedNotifications();
  }
}