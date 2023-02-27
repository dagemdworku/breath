import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

abstract class FirestoreApiService<T> {
  Logger get log;

  CollectionReference<T> get ref;

  String getNewDocId() {
    final uid = ref.doc().id;

    log.v('Generated uid "$uid"');

    return uid;
  }

  Future<List<T>> all({
    int limit = 9999,
  }) async {
    log.v('limit value "$limit"');

    try {
      QuerySnapshot<T>? doc = await ref.limit(limit).get();

      return doc.docs.map((e) => e.data()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
