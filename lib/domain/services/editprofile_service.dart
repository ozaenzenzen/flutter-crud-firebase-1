import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_crud_firebase_1/data/model/profiledata_model.dart';

class EditProfileService {
  static CollectionReference editProfileCollectionReference =
      FirebaseFirestore.instance.collection('editProfile');

  Future createProfileData(ProfileModel profileModel, String id) async {
    await editProfileCollectionReference.doc(id).set({
      'name': profileModel.name,
      'title': profileModel.title,
      'citizen': profileModel.citizen,
      'aboutMe': profileModel.aboutMe,
    });
  }

  // Future<ProfileModel> getProfileData(String id) async {
  Future<DocumentSnapshot> getProfileData(String id) async {
    // var profileData = ProfileModel.fromJson(editProfileCollectionReference.doc(id).get() as Map);
    // return profileData;
    return await editProfileCollectionReference.doc(id).get();
  }

  Stream<QuerySnapshot> getProfileData2() {
    return editProfileCollectionReference.snapshots();
  }

  Future updateProfileData(ProfileModel profileModel, String id) async {
    await editProfileCollectionReference.doc(id).update({
      'name': profileModel.name,
      'title': profileModel.title,
      'citizen': profileModel.citizen,
      'aboutMe': profileModel.aboutMe,
    });
  }

  Future deleteProfileData(String id) async {
    await editProfileCollectionReference.doc(id).delete();
  }
}
