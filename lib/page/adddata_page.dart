import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDataPage extends StatefulWidget {
  @override
  _AddDataPageState createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        centerTitle: true,
        elevation: 0,
        title: Text(
          "FAM CRUD Firestore | Add Data",
          style: GoogleFonts.raleway(
            fontSize: screenUtil.setSp(15),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
