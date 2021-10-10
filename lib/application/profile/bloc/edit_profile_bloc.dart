import 'package:bloc/bloc.dart';
import 'package:flutter_crud_firebase_1/model/profiledata_model.dart';
import 'package:flutter_crud_firebase_1/services/dataitem_service.dart';
import 'package:flutter_crud_firebase_1/services/editprofile_service.dart';
import 'package:meta/meta.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileInitial());

  Stream<EditProfileState> mapEventToState(EditProfileEvent event) async* {
    if (event is EditProfileEventUpdate) {
      yield EditProfileLoading();
      try {
        await EditProfileService()
            .updateProfileData(event.profileModel!, event.id.toString())
            .onError(
              (error, stackTrace) => EditProfileError(
                error.toString(),
              ),
            );
      } catch (e) {
        EditProfileError(e.toString());
      }
    }
  }
}
