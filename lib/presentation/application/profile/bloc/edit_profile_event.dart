part of 'edit_profile_bloc.dart';

@immutable
abstract class EditProfileEvent {}

class EditProfileEventUpdate extends EditProfileEvent {
  final ProfileModel? profileModel;
  final String? id;

  EditProfileEventUpdate({
    this.profileModel,
    this.id,
  });
}
