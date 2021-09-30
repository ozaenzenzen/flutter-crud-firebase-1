import 'package:bloc/bloc.dart';
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
