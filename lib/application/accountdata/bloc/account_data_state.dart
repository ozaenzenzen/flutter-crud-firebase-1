part of 'account_data_bloc.dart';

@immutable
abstract class AccountDataState {}

class AccountDataInitial extends AccountDataState {}

class AccountDataSuccess extends AccountDataState {}

class AccountDataLoading extends AccountDataState {}

class AccountDataError extends AccountDataState {}

class AccountDataLoaded extends AccountDataState {}
