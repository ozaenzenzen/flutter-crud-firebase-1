import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_crud_firebase_1/model/accountdata_model.dart';

class DatabaseService {
  static CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('account');
  DocumentReference? docref;

  Future createObjectAccount(AccountModel? accountModel, String id) async {
    // Future createObjectAccount(id, {name, title, email, citizen, aboutMe}) async {
    // print("ID create object accuount: $id");
    await collectionReference.doc(id).set({
      'name': accountModel!.name,
      'title': accountModel.title,
      'email': accountModel.email,
      'citizen': accountModel.citizen,
      'aboutMe': accountModel.aboutMe,
    });
  }

  Future createObjectAccount2(AccountModel? accountModel, String id) {
    // Future createObjectAccount(id, {name, title, email, citizen, aboutMe}) async {

    return collectionReference.doc(id).set({
      'name': accountModel!.name,
      'title': accountModel.title,
      'email': accountModel.email,
      'citizen': accountModel.citizen,
      'aboutMe': accountModel.aboutMe,
    });
  }

  Future<DocumentSnapshot> getDataAccount(id) async {
    return await collectionReference.doc(id).get();
  }

  Future<Either<dynamic, dynamic>> testMethodException() async {
    String? x;
    try {
      return right(x);
    } on FirebaseException catch (e) {
      String errorMessage = e.message.toString();

      return left(errorMessage);
    }
  }

  Future<QuerySnapshot> getAllDataAccount() async {
    // QuerySnapshot querySnapshot = await collectionReference.get();

    // final allData = querySnapshot.docs.map((doc) => doc.data()!);
    // // return allData;
    return await collectionReference.get();
  }

  // Stream<DocumentSnapshot> getAllDataAccount2() {
  Stream<QuerySnapshot> getAllDataAccount2() {
    return collectionReference.snapshots();
  }

  Future updateDataAccount(AccountModel accountModel, String id) async {
    await collectionReference.doc(id).update({
      'name': accountModel.name,
      'title': accountModel.title,
      'email': accountModel.email,
      'citizen': accountModel.citizen,
      'aboutMe': accountModel.aboutMe,
    });
  }

  Future updateDataAccount2(AccountModel? accountModel, String id) {
    return collectionReference.doc(id).update({
      'name': accountModel!.name,
      'title': accountModel.title,
      'email': accountModel.email,
      'citizen': accountModel.citizen,
      'aboutMe': accountModel.aboutMe,
    });
  }

  Future deleteDataAccount(String? id) async {
    await collectionReference.doc(id).delete();
  }
}
