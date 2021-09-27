import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_crud_firebase_1/model/account_model.dart';

class DatabaseService {
  static CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('account');

  Future createObjectAccount(AccountModel accountModel) async {
    // Future createObjectAccount(id, {name, title, email, citizen, aboutMe}) async {
    await collectionReference.doc(FieldValue.increment(1).toString()).set({
      'id': FieldValue.increment(1),
      'name': accountModel.name,
      'title': accountModel.title,
      'email': accountModel.email,
      'citizen': accountModel.citizen,
      'aboutMe': accountModel.aboutMe,
    });
  }

  Future<DocumentSnapshot> getDataAccount(id) async {
    return await collectionReference.doc(id).get();
  }
}
