part of 'account_data_bloc.dart';

@immutable
abstract class AccountDataEvent {}

class AccountDataEventSuccessLoad extends AccountDataEvent {
  //
}

class AccountDataEventUpdate extends AccountDataEvent {
  final AccountModel? accountModel;
  final String? id;

  AccountDataEventUpdate({
    this.accountModel,
    this.id,
  });
  static CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('account');
  Future updateDataAccount(AccountModel accountModel, String id) async {
    await collectionReference.doc(id).update({
      'name': accountModel.name,
      'title': accountModel.title,
      'email': accountModel.email,
      'citizen': accountModel.citizen,
      'aboutMe': accountModel.aboutMe,
    });
  }
}

class AccountDataEventCreate extends AccountDataEvent {
  final AccountModel? accountModel;
  final String? id;

  AccountDataEventCreate({
    this.accountModel,
    this.id,
  });
  // static CollectionReference collectionReference = FirebaseFirestore.instance.collection('account');
  // Future createObjectAccount(AccountModel accountModel, String id) async {
  //   // Future createObjectAccount(id, {name, title, email, citizen, aboutMe}) async {
  //   await collectionReference.doc(id).set({
  //     'name': accountModel.name,
  //     'title': accountModel.title,
  //     'email': accountModel.email,
  //     'citizen': accountModel.citizen,
  //     'aboutMe': accountModel.aboutMe,
  //   });
  // }
}
