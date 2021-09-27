import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_firebase_1/page/adddata_page.dart';
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
          child: Center(
            child: Text(
              "Home Page",
              style: GoogleFonts.raleway(
                fontSize: screenUtil.setSp(25),
                fontWeight: FontWeight.w800,
              ),
            ),
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
