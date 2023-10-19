import 'dart:convert';
import 'package:airports/Data/Remote/ResponseModel/airport_response_model.dart';
import 'package:flutter/foundation.dart';
import '../APIs/http_constant.dart';
import '../NetworkHandler/custom_dio.dart';
import 'package:get_storage/get_storage.dart';

class AirportRepository {
  static var customDio = CustomDio();
  static dynamic client;

  static Future<List<AirportDataResponseModel>> fetchAllData() async {
    List<AirportDataResponseModel> airports = [];
    try {
      client = await customDio.getDio();
      var response = await client.get(HttpConstants.airportUrl);
      if (response.statusCode == 200) {
        String jsonData = response.data; // Assuming the API returns a JSON string
        Map<String, dynamic> data = jsonDecode(jsonData);
        data.forEach((key, value) {
          airports.add(AirportDataResponseModel.fromJson(value));
        });

        return airports;
      } else {
        return List<AirportDataResponseModel>.empty();
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      rethrow;
    }
  }
}
