import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_firebase_1/data/ratecalculation_data.dart';
import 'package:flutter_crud_firebase_1/model/profiledata_model.dart';
import 'package:flutter_crud_firebase_1/page/editprofilepage.dart';
import 'package:flutter_crud_firebase_1/services/editprofile_service.dart';
import 'package:flutter_crud_firebase_1/utils/fam_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ScreenUtil screenUtil = ScreenUtil();
  RateCalculationData rateCalculationData = RateCalculationData();
  int totalStarsValue = 0;

  totalValue2() {
    var x = 0;
    for (var item in rateCalculationData.data) {
      print(item);
      x += int.parse(rateCalculationData.data[item].stars.toString());
      print(x);
    }
  }

  totalValue(int data) {
    return totalStarsValue += data;
  }

  EditProfileService editProfileService = EditProfileService();

  @override
  Widget build(BuildContext context) {
    // totalValue();
    return SingleChildScrollView(
      // child: FutureBuilder<ProfileModel>(
      child: FutureBuilder<DocumentSnapshot>(
          future: editProfileService.getProfileData("FlutterXOzan"),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.data == null) {
              return Container(
                height: screenUtil.screenHeight,
                child: Center(
                  child: Container(
                    height: screenUtil.setHeight(40),
                    width: screenUtil.setWidth(40),
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }
            var profileData =
                ProfileModel.fromJson(snapshot.data!.data() as Map);

            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenUtil.setHeight(20),
                vertical: screenUtil.setWidth(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Profile Page",
                        style: GoogleFonts.raleway(
                          color: Colors.pink.shade800,
                          fontSize: screenUtil.setSp(25),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          side: BorderSide(
                            color: Colors.pink.shade100,
                          ),
                        ),
                        onPressed: () {
                          Get.to(
                            () => EditProfilePage(),
                            arguments: {
                              'id': snapshot.data!.id,
                              'name': profileData.name,
                              'title': profileData.title,
                              'citizen': profileData.citizen,
                              'aboutMe': profileData.aboutMe,
                            },
                          );
                        },
                        child: Text(
                          "Edit Profile",
                          style: GoogleFonts.raleway(
                            color: Colors.pink.shade800,
                            fontSize: screenUtil.setSp(11),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenUtil.setWidth(15),
                  ),
                  Container(
                    width: screenUtil.screenWidth,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenUtil.setHeight(15),
                      vertical: screenUtil.setWidth(15),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.pink.shade100,
                          blurRadius: 7,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: screenUtil.setWidth(100),
                          // margin: EdgeInsets.symmetric(
                          //   horizontal: screenUtil.setHeight(10),
                          //   vertical: screenUtil.setWidth(10),
                          // ),
                          child: Image.network(
                            FAMImages.flutter_image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: screenUtil.setWidth(10),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${profileData.name}",
                                // "FlutterXOzan",
                                style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontSize: screenUtil.setSp(20),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: screenUtil.setWidth(5),
                              ),
                              Text(
                                "${profileData.title}",
                                // "Flutter Developer",
                                style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontSize: screenUtil.setSp(13),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: screenUtil.setWidth(17),
                              ),
                              Text(
                                "flutterxozan@gmail.com",
                                style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontSize: screenUtil.setSp(11),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: screenUtil.setWidth(5),
                              ),
                              Text(
                                "Citizen: ${profileData.citizen}",
                                // "Citizen: Indonesia ",
                                style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontSize: screenUtil.setSp(11),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenUtil.setWidth(15),
                  ),
                  Container(
                    width: screenUtil.screenWidth,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenUtil.setHeight(15),
                      vertical: screenUtil.setWidth(15),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.pink.shade100,
                          blurRadius: 7,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About Me",
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: screenUtil.setSp(22),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(5),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(5),
                        ),
                        Text(
                          "${profileData.aboutMe}",
                          // "${FAMStrings.lorem_ipsum}",
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: screenUtil.setSp(12),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenUtil.setWidth(15),
                  ),
                  Container(
                    width: screenUtil.screenWidth,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenUtil.setHeight(15),
                      vertical: screenUtil.setWidth(15),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.pink.shade100,
                          blurRadius: 7,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rate Calculation",
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: screenUtil.setSp(22),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(5),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(5),
                        ),
                        ListView.separated(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: rateCalculationData.data.length,
                          itemBuilder: (context, index) {
                            // totalStarsValue = totalStarsValue + int.parse(rateCalculationData.data[index].stars.toString());
                            // var y = totalValue(rateCalculationData.data[index].stars);
                            // print(y);
                            return ListTile(
                              title: Text(
                                "${rateCalculationData.data[index].name}",
                                style: GoogleFonts.raleway(
                                  // color: Colors.black,
                                  fontSize: screenUtil.setSp(14),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                "${rateCalculationData.data[index].desc}",
                                style: GoogleFonts.raleway(
                                  // color: Colors.black,
                                  fontSize: screenUtil.setSp(11),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          rateCalculationData.data[index].stars,
                                      itemBuilder: (context, index) {
                                        return Icon(
                                          CupertinoIcons.star_fill,
                                          color: Colors.amber,
                                          size: screenUtil.setSp(15),
                                        );
                                      },
                                    ),
                                  ),
                                  Text(
                                    "${rateCalculationData.data[index].stars}.0",
                                    style: GoogleFonts.raleway(
                                      color: Colors.black,
                                      fontSize: screenUtil.setSp(12),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              leading: Image.network(
                                FAMImages.flutter_image,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: screenUtil.setHeight(5),
                            );
                          },
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(5),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Value:",
                              style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: screenUtil.setSp(15),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "$totalStarsValue",
                              style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: screenUtil.setSp(15),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
    // return Container(
    //   child: Center(
    //     child: Text(
    //       "Profile Page",
    //       style: GoogleFonts.raleway(
    //         fontSize: screenUtil.setSp(25),
    //         fontWeight: FontWeight.w800,
    //       ),
    //     ),
    //   ),
    // );
  }
}
