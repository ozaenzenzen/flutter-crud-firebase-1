import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StateWidget {
  StateWidget._();

  static final StateWidget? stateWidget = StateWidget._();

  ScreenUtil screenUtil = ScreenUtil();

  Widget stateLoadingIndicator() {
    return Container(
      height: screenUtil.setHeight(30),
      width: screenUtil.setWidth(30),
      child: CircularProgressIndicator(),
    );
  }

  Widget stateErrorMessage(String errorMessage) {
    return AlertDialog(
      title: Text("Error"),
      content: Text("$errorMessage"),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("OK"),
        ),
      ],
    );
  }
}
