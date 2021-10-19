import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_firebase_1/model/accountdata_model.dart';
import 'package:flutter_crud_firebase_1/page/adddata_page.dart';
import 'package:flutter_crud_firebase_1/services/dataitem_service.dart';
import 'package:flutter_crud_firebase_1/widget/homedata_item.dart';
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
        Container(
          padding: EdgeInsets.symmetric(
              // vertical: screenUtil.setHeight(10),
              // horizontal: screenUtil.setWidth(15),
              ),
          height: screenUtil.screenHeight,
          width: screenUtil.screenWidth,
          child: StreamBuilder(
            stream: DatabaseService().getAllDataAccount2(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: Container(
                    height: screenUtil.setHeight(40),
                    width: screenUtil.setWidth(40),
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  padding: EdgeInsets.symmetric(
                    vertical: screenUtil.setHeight(10),
                    // horizontal: screenUtil.setWidth(15),
                  ),
                  itemBuilder: (context, index) {
                    AccountModel accountModelData = AccountModel.fromJson(
                        snapshot.data!.docs[index].data() as Map);
                    return Dismissible(
                      onDismissed: (direction) {
                        // direction
                      },
                      key: UniqueKey(),
                      background: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenUtil.setWidth(15),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Delete",
                          style: GoogleFonts.poppins(
                            fontSize: screenUtil.setSp(25),
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.red,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenUtil.setHeight(5),
                          ),
                          HomeDataItem(
                            id: snapshot.data!.docs[index].id,
                            name: accountModelData.name,
                            title: accountModelData.title,
                            email: accountModelData.email,
                            citizen: accountModelData.citizen,
                            aboutMe: accountModelData.aboutMe,
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(5),
                          ),
                        ],
                      ),
                    );
                  },
                  // separatorBuilder: (context, index) {
                  //   return SizedBox(
                  //     height: screenUtil.setHeight(15),
                  //   );
                  // },
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
              Get.to(
                () => AddDataPage(),
                arguments: {
                  'type': 'add',
                },
              );
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
  }
}
