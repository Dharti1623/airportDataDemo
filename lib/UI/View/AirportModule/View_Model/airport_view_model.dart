import 'package:airports/Config/Services/network_manager.dart';
import 'package:airports/Data/Remote/ResponseModel/airport_response_model.dart';
import 'package:airports/Network/Repository/airport_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AirportViewModel extends FullLifeCycleController {
  var airportsList = <AirportDataResponseModel>[].obs;
  late var internetData;
  var isLoading = true.obs;
  var onError = false.obs;

  @override
  void onInit() {
    internetData = Get.find<NetworkManager>().obs;
    super.onInit();
    getAllAirports();
  }

  Future<void> getAllAirports() async {
    GetStorage box = GetStorage();
    var offlineAirportList = box.read('airportData');

    print('Dharti $offlineAirportList');
    if (offlineAirportList == null && internetData.value.connectionType.value != 0) {
      //it will call API
      var airports = await AirportRepository.fetchAllData();

      if (airports != null) {
        isLoading.value = false;
        airportsList.value = airports;
        box.write('airportData', airports);
      } else {
        isLoading.value = false;
        onError.value = true;
      }
    } else if (offlineAirportList != null) {
      //if offline data is available then it will give offline data list
      var airports = await box.read('airportData');

      if (airports != null) {
        isLoading.value = false;
        airportsList.value = airports;
      } else {
        isLoading.value = false;
        onError.value = true;
      }
    } else {
      //If offline data is null and internet is also off then it will give empty data
      isLoading.value = false;
      onError.value = true;
    }
  }
}
