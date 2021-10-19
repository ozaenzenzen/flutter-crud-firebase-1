import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crud_firebase_1/data/model/accountdata_model.dart';
import 'package:flutter_crud_firebase_1/presentation/application/accountdata/bloc/account_data_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class AddDataPage extends StatefulWidget {
  @override
  _AddDataPageState createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  ScreenUtil screenUtil = ScreenUtil();

  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController citizenController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  var data = Get.arguments;

  FocusNode _focusNode = new FocusNode();

  void requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  Random random = Random();

  String generateRandomString(int len) {
    // var r = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => random.nextInt(33) + 89));
  }

  @override
  Widget build(BuildContext context) {
    print(data['type']);
    if (data['type'] == 'update') {
      nameController.text = data['name'];
      titleController.text = data['title'];
      emailController.text = data['email'];
      citizenController.text = data['citizen'];
      aboutMeController.text = data['aboutMe'];
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        centerTitle: true,
        elevation: 0,
        title: Text(
          (data['type'] == 'add')
              ? "FAM CRUD Firestore | Add Data"
              : "FAM CRUD Firestore | Update Data",
          style: GoogleFonts.raleway(
            fontSize: screenUtil.setSp(15),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => AccountDataBloc(),
        child: BlocConsumer<AccountDataBloc, AccountDataState>(
          listener: (context, state) {
            if (state is AccountDataLoading) {
              Container(
                alignment: Alignment.center,
                color: Colors.transparent,
                height: screenUtil.setHeight(500),
                child: CircularProgressIndicator(),
              );
            } else if (state is AccountDataError) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Error"),
                  content: Text("${state.errorMessage}"),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("OK"),
                    ),
                  ],
                ),
              );
            } else if (state is AccountDataSuccess) {
              Get.back();
            }
          },
          builder: (context, state) {
            print(state);
            if (state is AccountDataError) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Error"),
                  content: Text("${state.errorMessage}"),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("OK"),
                    ),
                  ],
                ),
              );
            }
            return SingleChildScrollView(
              child: Stack(
                children: [
                  (state is AccountDataLoading)
                      ? Container(
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          height: screenUtil.setHeight(500),
                          child: CircularProgressIndicator(),
                        )
                      : Center(
                          child: Container(),
                        ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenUtil.setWidth(20),
                      vertical: screenUtil.setHeight(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // nameController
                        Text(
                          "Name",
                          style: GoogleFonts.raleway(
                            fontSize: screenUtil.setSp(13),
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(5),
                        ),
                        TextField(
                          // focusNode: _focusNode,
                          // onTap: requestFocus,
                          controller: nameController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.pink.shade800,
                              ),
                            ),
                            constraints: BoxConstraints.tight(
                              Size(
                                screenUtil.screenWidth,
                                screenUtil.setHeight(40),
                              ),
                            ),
                            label: Text(
                              "Name",
                              style: GoogleFonts.raleway(
                                fontSize: screenUtil.setSp(12),
                                fontWeight: FontWeight.w600,
                                // color: (_focusNode.hasFocus)
                                //     ? Colors.pink.shade800
                                //     : Colors.grey.shade600,
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

                        // titleController
                        Text(
                          "Title",
                          style: GoogleFonts.raleway(
                            fontSize: screenUtil.setSp(13),
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(5),
                        ),
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            constraints: BoxConstraints.tight(
                              Size(
                                screenUtil.screenWidth,
                                screenUtil.setHeight(40),
                              ),
                            ),
                            label: Text(
                              "Title",
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
                          height: screenUtil.setHeight(15),
                        ),

                        // emailController
                        Text(
                          "Email",
                          style: GoogleFonts.raleway(
                            fontSize: screenUtil.setSp(13),
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(5),
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            constraints: BoxConstraints.tight(
                              Size(
                                screenUtil.screenWidth,
                                screenUtil.setHeight(40),
                              ),
                            ),
                            label: Text(
                              "Email",
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
                          height: screenUtil.setHeight(15),
                        ),

                        // citizenController
                        Text(
                          "Citizen",
                          style: GoogleFonts.raleway(
                            fontSize: screenUtil.setSp(13),
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(5),
                        ),
                        TextField(
                          controller: citizenController,
                          decoration: InputDecoration(
                            constraints: BoxConstraints.tight(
                              Size(
                                screenUtil.screenWidth,
                                screenUtil.setHeight(40),
                              ),
                            ),
                            label: Text(
                              "Citizen",
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
                          height: screenUtil.setHeight(15),
                        ),

                        // aboutMeController
                        Text(
                          "About",
                          style: GoogleFonts.raleway(
                            fontSize: screenUtil.setSp(13),
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(5),
                        ),
                        TextField(
                          textInputAction: TextInputAction.done,
                          onSubmitted: (aboutDataField) {
                            if (data['type'] == 'add') {
                              var accountData = AccountModel(
                                name: nameController.text,
                                title: titleController.text,
                                email: emailController.text,
                                citizen: citizenController.text,
                                aboutMe: aboutDataField,
                              );

                              // setState(() {
                              //   DatabaseService()
                              //       .createObjectAccount(accountData, data['id'])
                              //       .whenComplete(() {
                              //     FocusScope.of(context).unfocus();
                              //     return Get.back();
                              //   });
                              // });
                              context.read<AccountDataBloc>().add(
                                    AccountDataEventCreate(
                                      accountModel: accountData,
                                      id: generateRandomString(10),
                                    ),
                                  );
                            } else {
                              var accountData = AccountModel(
                                name: nameController.text,
                                title: titleController.text,
                                email: emailController.text,
                                citizen: citizenController.text,
                                aboutMe: aboutDataField,
                              );

                              // setState(() {
                              //   DatabaseService()
                              //       .updateDataAccount(accountData, data['id'])
                              //       .whenComplete(
                              //     () {
                              //       FocusScope.of(context).unfocus();
                              //       return Get.back();
                              //     },
                              //   );
                              // });
                              context.read<AccountDataBloc>().add(
                                    AccountDataEventUpdate(
                                      accountModel: accountData,
                                      id: data['id'],
                                    ),
                                  );
                            }
                          },
                          controller: aboutMeController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            label: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "About1",
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
                          height: screenUtil.setHeight(20),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              (data['type'] == 'add')
                                  ? Container()
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.redAccent.shade700,
                                        // primary: Colors.pink.shade800,
                                      ),
                                      onPressed: () {
                                        showDialog(
                                          builder: (contextDialog) {
                                            return AlertDialog(
                                              title: Text(
                                                "Delete",
                                                style: GoogleFonts.raleway(
                                                  fontSize:
                                                      screenUtil.setSp(18),
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              content: Text(
                                                "Are you sure want to delete this item? You won't be able to revert / undo this.",
                                                style: GoogleFonts.raleway(
                                                  fontSize:
                                                      screenUtil.setSp(13),
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors
                                                        .redAccent.shade700,
                                                    elevation: 0,
                                                  ),
                                                  onPressed: () {
                                                    Get.back();
                                                    // setState(() {
                                                    //   DatabaseService()
                                                    //       .deleteDataAccount(
                                                    //           data['id'])
                                                    //       .whenComplete(
                                                    //           () => Get.back());
                                                    // });
                                                    context
                                                        .read<AccountDataBloc>()
                                                        .add(
                                                          AccountDataEventDelete(
                                                            id: data['id'],
                                                          ),
                                                        );
                                                  },
                                                  child: Text("Yes"),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text("No"),
                                                ),
                                              ],
                                            );
                                          },
                                          context: context,
                                        );
                                      },
                                      child: Text("Delete Data"),
                                    ),
                              SizedBox(
                                width: screenUtil.setWidth(10),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.pink.shade800,
                                ),
                                onPressed: () {
                                  if (data['type'] == 'add') {
                                    var accountData = AccountModel(
                                      // id: int.parse(FieldValue.increment(1).toString()),
                                      name: (nameController.text.isNotEmpty)
                                          ? nameController.text
                                          : "Null",
                                      title: (titleController.text.isNotEmpty)
                                          ? titleController.text
                                          : "Null",
                                      email: (emailController.text.isNotEmpty)
                                          ? emailController.text
                                          : "Null",
                                      citizen:
                                          (citizenController.text.isNotEmpty)
                                              ? citizenController.text
                                              : "Null",
                                      aboutMe:
                                          (aboutMeController.text.isNotEmpty)
                                              ? aboutMeController.text
                                              : "Null",
                                    );

                                    // setState(() {
                                    //   DatabaseService()
                                    //       .createObjectAccount(accountData, data['id'])
                                    //       .whenComplete(() {
                                    //     FocusScope.of(context).unfocus();
                                    //     return Get.back();
                                    //   });
                                    // });

                                    context.read<AccountDataBloc>().add(
                                          AccountDataEventCreate(
                                            accountModel: accountData,
                                            id: generateRandomString(10),
                                          ),
                                        );
                                  } else {
                                    var accountData = AccountModel(
                                      // id: int.parse(FieldValue.increment(1).toString()),
                                      name: nameController.text,
                                      title: titleController.text,
                                      email: emailController.text,
                                      citizen: citizenController.text,
                                      aboutMe: aboutMeController.text,
                                    );

                                    // setState(() {
                                    //   DatabaseService()
                                    //       .updateDataAccount(
                                    //           accountData, data['id'])
                                    //       .whenComplete(
                                    //     () {
                                    //       FocusScope.of(context).unfocus();
                                    //       return Get.back();
                                    //     },
                                    //   );
                                    // });
                                    context.read<AccountDataBloc>().add(
                                          AccountDataEventUpdate(
                                            accountModel: accountData,
                                            id: data['id'],
                                          ),
                                        );
                                  }
                                },
                                child: Text(
                                  (data['type'] == 'add')
                                      ? "Add Data"
                                      : "Update Data",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
