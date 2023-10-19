import 'package:airports/Config/Services/network_manager.dart';
import 'package:airports/UI/View/AirportModule/View/airport_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var internetData = Get.find<NetworkManager>().obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AirportScreen()/*Obx(() {
        return internetData.value.connectionType.value == 0
              ? const Text('no internet')
              : AirportScreen();
      })*/
    );
  }
}
