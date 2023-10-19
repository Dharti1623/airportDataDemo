
import 'package:airports/Config/Services/network_manager.dart';
import 'package:airports/UI/View/AirportModule/View/airport_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  // final NetworkManager internetData = Get.find<NetworkManager>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: internetData.connectionType.value == 0
      //     ? const Text('data')
      //     : AirportScreen(),
      child:AirportScreen() ,
      // child: GetBuilder<NetworkManager>(
      //     builder: (builder) => internetData.connectionType == 0
      //         ? const Text('data')
      //         : AirportScreen()),
    );
  }
}
