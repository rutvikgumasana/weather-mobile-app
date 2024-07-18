import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utils/network_dio/network_dio.dart';

class HomeController extends GetxController {
  final NetworkDioHttp networkDioHttp = NetworkDioHttp();
  RxBool loading = false.obs;
  final searchController = TextEditingController();
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
  WeatherModel? weatherModel;

  // Get Weather Api Function
  Future<void> getWeather({required String place}) async {
    loading.value = true;
    var response = await networkDioHttp.getRequest(
      url: 'http://api.weatherapi.com/v1/forecast.json?key=054dc98b868e42f3a64111420241201&q=$place',
      name: 'getWeather',
    );
    loading.value = false;
    if (response.data != null && response.statusCode == 200) {
      // Parse the JSON response
      weatherModel = WeatherModel.fromJson(response.data);
    }
  }
}
