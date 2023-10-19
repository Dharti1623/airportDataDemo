import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../Utils/Constants/color_constants.dart';


class NetworkManager extends GetxController {
  //0 = No Internet, 1 = WIFI Connected ,2 = Mobile Data Connected.
  var connectionType = 0.obs;
  final Connectivity _connectivity = Connectivity();

  late StreamSubscription _streamSubscription;

  NetworkManager();

  @override
  void onInit() {
    super.onInit();
    getConnectivityType();
    _streamSubscription = _connectivity.onConnectivityChanged.listen(updateState);
  }

  Future<void> getConnectivityType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return updateState(connectivityResult);
  }

  updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = 1;
        // customSnackBar('Wifi Connected',AppColor.bgGreenClr);
        update();
        break;
      case ConnectivityResult.mobile:
        connectionType.value = 2;
        // customSnackBar('Mobile Data Connected',AppColor.bgGreenClr);
        update();
        break;
      case ConnectivityResult.none:
        connectionType.value = 0;
        // customSnackBar('No Internet',AppColor.bgRedClr);
        update();
        break;
      default:print('Failed to get connection type');
      break;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}