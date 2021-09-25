import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
          "FAM CRUD Firestore | Edit Profile",
          style: GoogleFonts.raleway(
            fontSize: screenUtil.setSp(15),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
