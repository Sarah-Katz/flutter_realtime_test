import 'package:cloud_firestore/cloud_firestore.dart';

class CustomDatabase {
  static final FirebaseFirestore database = FirebaseFirestore.instance;

// Collections
  static final CollectionReference messages = database.collection('messages');

  static void addData(
      CollectionReference collection, Map<String, dynamic> data) {
    collection.add(data);
  }

  static List<QueryDocumentSnapshot<Object?>> readData(
      CollectionReference collection) {
    List<QueryDocumentSnapshot<Object?>> list = [];
    collection.get().then((value) {
      list = value.docs;
    });
    return list;
  }

  static Stream<QuerySnapshot> streamData(CollectionReference collection) {
    String collectionName = collection.path;
    return database.collection(collectionName).snapshots();
  }
}
