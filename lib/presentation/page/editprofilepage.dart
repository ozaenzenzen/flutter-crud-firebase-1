import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crud_firebase_1/data/model/profiledata_model.dart';
import 'package:flutter_crud_firebase_1/presentation/application/profile/bloc/edit_profile_bloc.dart';
import 'package:flutter_crud_firebase_1/presentation/widget/state_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  ScreenUtil screenUtil = ScreenUtil();

  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController citizenController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  var data = Get.arguments;

  dataFromProfile() {
    nameController.text = data['name'];
    titleController.text = data['title'];
    citizenController.text = data['citizen'];
    aboutController.text = data['aboutMe'];
  }

  @override
  Widget build(BuildContext context) {
    dataFromProfile();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        centerTitle: true,
        elevation: 0,
        title: Text(
          "FAM CRUD Firestore | Edit Profile",
          style: GoogleFonts.raleway(
            fontSize: screenUtil.setSp(15),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => EditProfileBloc(),
        child: BlocConsumer<EditProfileBloc, EditProfileState>(
          listener: (context, state) {
            if (state is EditProfileLoading) {
              Container(
                height: screenUtil.setHeight(500),
                alignment: Alignment.center,
                child: StateWidget.stateWidget!.stateLoadingIndicator(),
              );
            } else if (state is EditProfileError) {
              showDialog(
                context: context,
                builder: (context) {
                  return StateWidget.stateWidget!
                      .stateErrorMessage(state.errorMessage);
                },
              );
            } else if (state is EditProfileSuccess) {
              Get.back();
            }
          },
          builder: (context, state) {
            print(state);
            if (state is EditProfileError) {
              showDialog(
                context: context,
                builder: (context) {
                  return StateWidget.stateWidget!
                      .stateErrorMessage(state.errorMessage);
                },
              );
            } else if (state is EditProfileLoading) {
              return Container(
                height: screenUtil.setHeight(500),
                alignment: Alignment.center,
                child: StateWidget.stateWidget!.stateLoadingIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenUtil.setHeight(20),
                      bottom: screenUtil.setHeight(10),
                      left: screenUtil.setWidth(15),
                    ),
                    child: Text(
                      "Edit Profile",
                      style: GoogleFonts.raleway(
                        color: Colors.pink.shade800,
                        fontSize: screenUtil.setSp(28),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  editProfileContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Personal",
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: screenUtil.setSp(22),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(15),
                        ),

                        // Name Field
                        editProfileTextField("Name", nameController),

                        // Title Field
                        editProfileTextField("Title", titleController),

                        // Citizen Field
                        editProfileTextField("Citizen", citizenController),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(15),
                  ),
                  editProfileContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About Me",
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: screenUtil.setSp(22),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(15),
                        ),

                        // Name Field
                        Text(
                          "About Me",
                          style: GoogleFonts.raleway(
                            fontSize: screenUtil.setSp(12),
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(5),
                        ),
                        TextField(
                          controller: aboutController,
                          textInputAction: TextInputAction.done,
                          onSubmitted: (aboutDataField) {
                            //
                          },
                          maxLines: 5,
                          decoration: InputDecoration(
                            label: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "About Me",
                                style: GoogleFonts.raleway(
                                  fontSize: screenUtil.setSp(12),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(15),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenUtil.setWidth(20),
                    ),
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink.shade800,
                      ),
                      onPressed: () {
                        var profileData = ProfileModel(
                          name: nameController.text,
                          title: titleController.text,
                          citizen: citizenController.text,
                          aboutMe: aboutController.text,
                        );

                        context.read<EditProfileBloc>().add(
                              EditProfileEventUpdate(
                                profileModel: profileData,
                                id: data['id'],
                              ),
                            );
                      },
                      child: Text("Change"),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget editProfileTextField(
    String nameField,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameField,
          style: GoogleFonts.raleway(
            fontSize: screenUtil.setSp(12),
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: screenUtil.setHeight(5),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            constraints: BoxConstraints.tight(
              Size(
                screenUtil.screenWidth,
                screenUtil.setHeight(40),
              ),
            ),
            label: Text(
              nameField,
              style: GoogleFonts.raleway(
                fontSize: screenUtil.setSp(12),
                fontWeight: FontWeight.w600,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        SizedBox(
          height: screenUtil.setHeight(10),
        ),
      ],
    );
  }

  Widget editProfileContainer({Widget? child}) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenUtil.setWidth(10),
        vertical: screenUtil.setHeight(10),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenUtil.setWidth(10),
        vertical: screenUtil.setHeight(10),
      ),
      // height: screenUtil.setHeight(400),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            color: Colors.pink.shade100,
            spreadRadius: 1,
            blurRadius: 6,
          )
        ],
      ),
      child: child,
    );
  }
}
