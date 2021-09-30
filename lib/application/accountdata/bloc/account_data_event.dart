part of 'account_data_bloc.dart';

@immutable
abstract class AccountDataEvent {}

class AccountDataSuccessLoad extends AccountDataEvent {}