part of 'account_data_bloc.dart';

@immutable
abstract class AccountDataEvent {}

class AccountDataSuccessLoad extends AccountDataEvent {
  //
}

class UpdateAccountData extends AccountDataEvent {
  final AccountModel? accountModel; 
  final String? id;

  UpdateAccountData({
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
