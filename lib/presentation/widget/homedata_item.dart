import 'package:flutter/material.dart';
import 'package:flutter_crud_firebase_1/presentation/page/adddata_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_crud_firebase_1/utils/fam_images.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeDataItem extends StatefulWidget {
  final String? id;
  final String? name;
  final String? title;
  final String? email;
  final String? citizen;
  final String? aboutMe;

  HomeDataItem({
    this.id,
    this.name,
    this.title,
    this.email,
    this.citizen,
    this.aboutMe,
  });
  @override
  _HomeDataItemState createState() => _HomeDataItemState();
}

class _HomeDataItemState extends State<HomeDataItem> {
  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => AddDataPage(),
          arguments: {
            'type': 'update',
            'id': widget.id,
            'name': widget.name,
            'title': widget.title,
            'email': widget.email,
            'citizen': widget.citizen,
            'aboutMe': widget.aboutMe,
          },
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          // vertical: screenUtil.setHeight(15),
          horizontal: screenUtil.setWidth(15),
        ),
        width: screenUtil.screenWidth,
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
        child: Container(
          margin: EdgeInsets.all(8),
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("${snapshot.data!.docs[index].data()}"),
                    Text(
                      "${widget.name}",
                      style: GoogleFonts.poppins(
                        fontSize: screenUtil.setSp(20),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "${widget.title}",
                      style: GoogleFonts.poppins(
                        fontSize: screenUtil.setSp(14),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    Text(
                      "${widget.email}",
                      style: GoogleFonts.poppins(
                        fontSize: screenUtil.setSp(11),
                      ),
                    ),
                    Text(
                      "${widget.citizen}",
                      style: GoogleFonts.poppins(
                        fontSize: screenUtil.setSp(11),
                      ),
                    ),
                    Text(
                      "${widget.aboutMe}",
                      style: GoogleFonts.poppins(
                        fontSize: screenUtil.setSp(11),
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
