import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_firebase_1/model/account_model.dart';
import 'package:flutter_crud_firebase_1/page/adddata_page.dart';
import 'package:flutter_crud_firebase_1/services/database_service.dart';
import 'package:flutter_crud_firebase_1/utils/fam_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // StreamBuilder<DocumentSnapshot>(
        Container(
          height: screenUtil.screenHeight,
          child: StreamBuilder(
            stream: DatabaseService().getAllDataAccount2(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    AccountModel accountModelData = AccountModel.fromJson(
                        snapshot.data!.docs[index].data() as Map);
                    return Container(
                      margin: EdgeInsets.symmetric(
                        vertical: screenUtil.setHeight(15),
                        horizontal: screenUtil.setWidth(15),
                      ),
                      width: screenUtil.screenWidth,
                      // height: screenUtil.setHeight(90),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            color: Colors.pink.shade100,
                            spreadRadius: 1,
                            blurRadius: 6,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.network(
                              FAMImages.flutter_image,
                              width: screenUtil.setWidth(60),
                              height: screenUtil.setHeight(60),
                            ),
                          ),
                          SizedBox(
                            width: screenUtil.setWidth(5),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text("${snapshot.data!.docs[index].data()}"),
                              Text("${accountModelData.name}"),
                              Text("${accountModelData.title}"),
                              Text("${accountModelData.email}"),
                              Text("${accountModelData.citizen}"),
                              Text("${accountModelData.aboutMe}"),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Container(
                    height: screenUtil.setHeight(40),
                    width: screenUtil.setWidth(40),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
        Positioned(
          bottom: screenUtil.setHeight(10),
          right: screenUtil.setHeight(10),
          // alignment: Alignment.bottomRight,
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => AddDataPage());
            },
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.add_circled_solid,
                ),
                SizedBox(
                  width: screenUtil.setWidth(10),
                ),
                Text(
                  "Add",
                  style: GoogleFonts.raleway(
                    fontSize: screenUtil.setSp(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              minimumSize: Size(
                screenUtil.setWidth(120),
                screenUtil.setHeight(40),
              ),
              primary: Colors.pink.shade800,
            ),
          ),
        ),
      ],
    );
    // return Container(
    //   child: Center(
    //     child: Text(
    //       "Home Page",
    //       style: GoogleFonts.raleway(
    //         fontSize: screenUtil.setSp(25),
    //         fontWeight: FontWeight.w800,
    //       ),
    //     ),
    //   ),
    // );
  }
}
