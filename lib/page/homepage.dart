import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScreenUtil screenUtil = ScreenUtil();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Home Page",
          style: GoogleFonts.raleway(
            fontSize: screenUtil.setSp(25),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
