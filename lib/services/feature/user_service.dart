import 'package:breath/breath.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService extends FirestoreApiService<User> {
  @override
  get log => getLogger('UserService');

  @override
  CollectionReference<User> get ref => FirebaseFirestore.instance
      .collection(FirestoreCollectionsConstant.users)
      .withConverter<User>(
        fromFirestore: (snapshot, _) => User.fromJson(
          snapshot.data()!..['id'] = snapshot.id,
        ),
        toFirestore: (model, _) => model.toJson(),
      );
}
