import 'package:flutter/material.dart';
import 'color_constants.dart';

BoxDecoration screenBgColor = BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    AppColor.bgWhiteClr,
    AppColor.transparentClr,
    AppColor.bgWhiteClr,
  ],
  // stops: const [0,0.3893,1.0]
));


ButtonStyle btnStyle = ElevatedButton.styleFrom(
  shape: CircleBorder(),
  backgroundColor: AppColor.transparentClr,
  padding: EdgeInsets.all(0),
);

const TextStyle tabBarTxtStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, fontFamily: 'Pacifico', color: AppColor.bgWhiteClr);
