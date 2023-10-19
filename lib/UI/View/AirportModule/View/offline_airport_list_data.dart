import 'package:airports/Data/Remote/ResponseModel/airport_response_model.dart';
import 'package:airports/UI/CustomWidgets/common_appbar.dart';
import 'package:airports/UI/CustomWidgets/custom_loading.dart';
import 'package:airports/UI/View/AirportModule/View/airport_list_data.dart';
import 'package:airports/UI/View/AirportModule/View_Model/airport_view_model.dart';
import 'package:airports/Utils/Constants/color_constants.dart';
import 'package:airports/Utils/Constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class OfflineAirportListData extends StatelessWidget {
  OfflineAirportListData({super.key});
  List<AirportDataResponseModel> airportsList = GetStorage().read('airportData');
  @override
  Widget build(BuildContext context) {
    // print('Dharti--->$airportsList');
    return SafeArea(
      child: Scaffold(
          appBar: commonAppBar(context, title: AppStrings.airportsOffline,isAirportScreen: false),
          body: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                physics: const BouncingScrollPhysics(),
                itemCount: airportsList.length,
                itemBuilder: (context, index) {
                  return AirportListData(
                      airportsList[index]);
                }),
          ),
    );
  }
}
