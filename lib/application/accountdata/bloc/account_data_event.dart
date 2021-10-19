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
}

class AccountDataEventCreate extends AccountDataEvent {
  final AccountModel? accountModel;
  final String? id;

  AccountDataEventCreate({
    this.accountModel,
    this.id,
  });
}

class AccountDataEventDelete extends AccountDataEvent {
  final String? id;

  AccountDataEventDelete({
    this.id,
  });
}
