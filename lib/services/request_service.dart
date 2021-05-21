import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/request.dart';

class RequestService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _collectionName = 'requests';
  late CollectionReference<Request> _ref;

  Map<String, Request> _cache = <String, Request>{};

  RequestService() {
    _ref = _db.collection(_collectionName).withConverter(
        fromFirestore: (snapshots, _) => Request.fromJson(snapshots.data()!),
        toFirestore: (req, _) => req.toJson());
  }

  List<Request> getCachedRequests() {
    return _cache.values.toList();
  }

  Future<List<Request>> loadRequests() async {
    _ref.get().then((value) {
      value.docs.forEach((element) {
        var req = element.data();
        req.uid = element.id;
        _cache[element.id] = req;
      });
      return getCachedRequests();
    });
    return getCachedRequests();
  }

  Future<void> saveRequest(Request request) async {
    return _ref.doc(request.uid!).set(request);
  }

  getRequestsStream() {
    Stream<QuerySnapshot> s = _ref.snapshots();
  }
}
