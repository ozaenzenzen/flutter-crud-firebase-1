import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_crud_firebase_1/model/accountdata_model.dart';
import 'package:flutter_crud_firebase_1/services/dataitem_service.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'account_data_event.dart';
part 'account_data_state.dart';

class AccountDataBloc extends Bloc<AccountDataEvent, AccountDataState> {
  AccountDataBloc() : super(AccountDataInitial());

  Stream<AccountDataState> mapEventToState(AccountDataEvent event) async* {
    print("Coming event: $event");
    if (event is AccountDataEventCreate) {
      createObjectAccount(event.accountModel, event.id.toString());
      print("accountModel: ${event.accountModel}");
      print("id: ${event.id}");
      print("state: $state");
      yield AccountDataLoading();
      try {
        // Future data = await DatabaseService().createObjectAccount2(
        await DatabaseService()
            .createObjectAccount2(
          event.accountModel,
          event.id.toString(),
        )
            .onError((error, stackTrace) {
          AccountDataError(error.toString());
        });

        yield AccountDataSuccess();
        // yield AccountDataSuccess(data.whenComplete(() => Get.back()));
      } catch (e) {
        yield AccountDataError(e.toString());
      }
    } else if (event is AccountDataEventUpdate) {
      //
    }
  }

  Stream<AccountDataState> createObjectAccount(
      AccountModel? accountModel, String id) async* {
    print("accountModel: $accountModel");
    print("id: $id");
    print("state: $state");
    yield AccountDataLoading();
    try {
      await DatabaseService()
          .createObjectAccount2(accountModel!, id)
          .onError((error, stackTrace) {
        AccountDataError(error.toString());
      });

      yield AccountDataSuccess();
    } catch (e) {
      yield AccountDataError(e.toString());
    }
  }
}
