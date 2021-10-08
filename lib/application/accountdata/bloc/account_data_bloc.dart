import 'package:bloc/bloc.dart';
import 'package:flutter_crud_firebase_1/model/accountdata_model.dart';
import 'package:flutter_crud_firebase_1/services/dataitem_service.dart';
import 'package:meta/meta.dart';

part 'account_data_event.dart';
part 'account_data_state.dart';

class AccountDataBloc extends Bloc<AccountDataEvent, AccountDataState> {
  AccountDataBloc() : super(AccountDataInitial());

  Stream<AccountDataState> mapEventToState(AccountDataEvent event) async* {
    print("Coming event: $event");
    if (event is AccountDataEventCreate) {
      // print("accountModel: ${event.accountModel}");
      // print("id: ${event.id}");
      // print("state: $state");
      yield AccountDataLoading();
      try {
        await DatabaseService()
            .createObjectAccount2(
          event.accountModel,
          event.id.toString(),
        )
            .onError((error, stackTrace) {
          AccountDataError(error.toString());
        });

        yield AccountDataSuccess();
      } catch (e) {
        yield AccountDataError(e.toString());
      }
    } else if (event is AccountDataEventUpdate) {
      yield AccountDataLoading();
      try {
        await DatabaseService()
            .updateDataAccount2(
          event.accountModel,
          event.id.toString(),
        )
            .onError((error, stackTrace) {
          AccountDataError(error.toString());
        });

        yield AccountDataSuccess();
      } catch (e) {
        yield AccountDataError(e.toString());
      }
    } else if (event is AccountDataEventDelete) {
      yield AccountDataLoading();
      try {
        await DatabaseService()
            .deleteDataAccount(event.id.toString())
            .onError((error, stackTrace) {
          AccountDataError(error.toString());
        });

        yield AccountDataSuccess();
      } catch (e) {
        yield AccountDataError(e.toString());
      }
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
