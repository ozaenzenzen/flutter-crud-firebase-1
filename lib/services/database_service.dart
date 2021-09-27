import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  static CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('account');

  Future createObjectAccount(id, {name, desc, stars}) async {
    await collectionReference.doc(id).set({
      'id': id,
      'name': name,
      'desc': desc,
      'stars': stars,
    });
  }
}
