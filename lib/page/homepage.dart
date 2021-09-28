import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_firebase_1/model/account_model.dart';
import 'package:flutter_crud_firebase_1/page/adddata_page.dart';
import 'package:flutter_crud_firebase_1/services/database_service.dart';
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
                    return HomeDataItem(
                      name: accountModelData.name,
                      title: accountModelData.title,
                      email: accountModelData.email,
                      citizen: accountModelData.citizen,
                      aboutMe: accountModelData.aboutMe,
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
