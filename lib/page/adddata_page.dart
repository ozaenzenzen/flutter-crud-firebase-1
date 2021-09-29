import 'package:flutter/material.dart';
import 'package:flutter_crud_firebase_1/model/account_model.dart';
import 'package:flutter_crud_firebase_1/services/database_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: SingleChildScrollView(
        child: Container(
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
                controller: nameController,
                decoration: InputDecoration(
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

                    setState(() {
                      DatabaseService()
                          .createObjectAccount(accountData)
                          .whenComplete(() {
                        FocusScope.of(context).unfocus();
                        return Get.back();
                      });
                    });
                  } else {
                    var accountData = AccountModel(
                      name: nameController.text,
                      title: titleController.text,
                      email: emailController.text,
                      citizen: citizenController.text,
                      aboutMe: aboutDataField,
                    );

                    setState(() {
                      DatabaseService()
                          .updateDataAccount(accountData, data['name'])
                          .whenComplete(
                        () {
                          FocusScope.of(context).unfocus();
                          return Get.back();
                        },
                      );
                    });
                  }
                },
                controller: aboutMeController,
                maxLines: 5,
                decoration: InputDecoration(
                  label: Text(
                    "About",
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
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Delete",
                                      style: GoogleFonts.raleway(
                                        fontSize: screenUtil.setSp(18),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    content: Text(
                                      "Are you sure want to delete this item? You won't be able to revert / undo this.",
                                      style: GoogleFonts.raleway(
                                        fontSize: screenUtil.setSp(13),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.redAccent.shade700,
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          Get.back();
                                          setState(() {
                                            DatabaseService()
                                                .deleteDataAccount(nameController.text)
                                                .whenComplete(() => Get.back());
                                          });
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
                            name: nameController.text,
                            title: titleController.text,
                            email: emailController.text,
                            citizen: citizenController.text,
                            aboutMe: aboutMeController.text,
                          );

                          setState(() {
                            DatabaseService()
                                .createObjectAccount(accountData)
                                .whenComplete(() {
                              FocusScope.of(context).unfocus();
                              return Get.back();
                            });
                          });
                        } else {
                          var accountData = AccountModel(
                            // id: int.parse(FieldValue.increment(1).toString()),
                            name: nameController.text,
                            title: titleController.text,
                            email: emailController.text,
                            citizen: citizenController.text,
                            aboutMe: aboutMeController.text,
                          );

                          setState(() {
                            DatabaseService()
                                .updateDataAccount(accountData, data['name'])
                                .whenComplete(
                              () {
                                FocusScope.of(context).unfocus();
                                return Get.back();
                              },
                            );
                          });
                        }
                      },
                      child: Text(
                        (data['type'] == 'add') ? "Add Data" : "Update Data",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
