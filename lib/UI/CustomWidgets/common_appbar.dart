import 'package:airports/UI/View/AirportModule/View/offline_airport_list_data.dart';
import 'package:airports/Utils/Constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

commonAppBar(BuildContext context, {required String title, required bool isAirportScreen}) {
  return AppBar(
    title: Text(title),
    actions: [
      isAirportScreen ? IconButton(
          onPressed: () {
            Get.to(()=>OfflineAirportListData());
          },
          icon: const Icon(Icons.add)) : SizedBox()
    ],
    iconTheme: IconThemeData(color: AppColor().onPrimaryColor(context)),
    centerTitle: true,
    titleTextStyle:
        TextStyle(color: AppColor().onPrimaryColor(context), fontSize: 20),
    backgroundColor: Theme.of(context).primaryColor,
  );
}
