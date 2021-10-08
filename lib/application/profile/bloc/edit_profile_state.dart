part of 'edit_profile_bloc.dart';

@immutable
abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {}

class EditProfileError extends EditProfileState {
  final String errorMessage;
  EditProfileError(this.errorMessage);
}

class EditProfileGetSuccess extends EditProfileState {}
