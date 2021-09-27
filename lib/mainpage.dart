import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_firebase_1/page/homepage.dart';
import 'package:flutter_crud_firebase_1/page/profilepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController();
  ScreenUtil screenUtil = ScreenUtil();

  List<Widget> page = [
    HomePage(),
    ProfilePage(),
  ];
  var initIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        centerTitle: true,
        elevation: 0,
        title: Text(
          (initIndex == 0)
              ? "FAM CRUD Firestore | Home"
              : "FAM CRUD Firestore | Profile",
          style: GoogleFonts.raleway(
            fontSize: screenUtil.setSp(15),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: PageView(
        children: page,
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            initIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[100],
        currentIndex: initIndex,
        selectedItemColor: Colors.pink[800],
        unselectedItemColor: Colors.grey.shade600,
        onTap: (index) {
          setState(() {
            initIndex = index;
            // print(initIndex);
            pageController.jumpToPage(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              CupertinoIcons.house_fill,
              color: (initIndex == 0) ? Colors.pink[800] : Colors.grey.shade600,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              CupertinoIcons.person_fill,
              color: (initIndex == 1) ? Colors.pink[800] : Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
