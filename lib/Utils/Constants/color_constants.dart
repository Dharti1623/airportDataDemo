import 'package:flutter/material.dart';

class AppColor{

  static const Color bgWhiteClr =  Color(0xFFFFFFFF);
  static const Color bgBlackClr =  Color(0xFF000000);
  static const Color transparentClr =  Colors.transparent;

  primaryColor(BuildContext context){
    return Theme.of(context).primaryColor;
  }

  onPrimaryColor(BuildContext context){
    return Theme.of(context).colorScheme.onPrimary;
  }

  onPrimaryContainerColor(BuildContext context){
    return Theme.of(context).colorScheme.onPrimaryContainer;
  }

  onErrorColor(BuildContext context){
    return Theme.of(context).colorScheme.onError;
  }


}
