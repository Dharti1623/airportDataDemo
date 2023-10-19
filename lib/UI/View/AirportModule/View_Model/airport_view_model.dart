import 'package:airports/Data/Remote/ResponseModel/airport_response_model.dart';
import 'package:airports/Network/Repository/airport_repository.dart';
import 'package:get/get.dart';

class AirportViewModel extends FullLifeCycleController {

  var airportsList = <AirportDataResponseModel>[].obs;
  var isLoading = true.obs;
  var onError = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllAirports();
  }

  Future<void> getAllAirports() async {
    var airports = await AirportRepository.fetchAllData();

    if (airports != null) {
      isLoading.value = false;
      airportsList.value = airports;
    } else {
      isLoading.value = false;
      onError.value = true;
    }
  }
}