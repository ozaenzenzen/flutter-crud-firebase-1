import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ScreenUtil screenUtil = ScreenUtil();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Profile Page",
          style: GoogleFonts.raleway(
            fontSize: screenUtil.setSp(25),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
