import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_crud_firebase_1/model/accountdata_model.dart';
import 'package:meta/meta.dart';

part 'account_data_event.dart';
part 'account_data_state.dart';

class AccountDataBloc extends Bloc<AccountDataEvent, AccountDataState> {
  AccountDataBloc() : super(AccountDataInitial()) {
    on<AccountDataEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
