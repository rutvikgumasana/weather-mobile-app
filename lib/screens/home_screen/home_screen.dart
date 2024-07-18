import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:weather_app/components/colors.dart';
import 'package:weather_app/components/primary_text_field.dart';
import 'package:weather_app/controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    // Get Weather API Call
    homeController.getWeather(place: 'Surat');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xff06437a),
                      Color(0xff090832),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.05, 1]),
              ),
              child: Obx(
                () => homeController.loading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: size.height * 0.03),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //Search Bar
                                  Expanded(
                                      child: PrimaryTextField(
                                    controller: homeController.searchController,
                                    hintText: 'Search Place',
                                    keyboardType: TextInputType.text,
                                    fillColor: AppColor.whiteColor,
                                  )),
                                  IconButton(
                                    onPressed: () { 
                                      // On Search Weather API Call
                                      if (homeController.searchController.text.isNotEmpty) {
                                        homeController.getWeather(place: homeController.searchController.text);
                                      }
                                    },
                                    icon: const Icon(Icons.search, color: AppColor.whiteColor),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: size.height * 0.03),
                              child: Text(
                                "${homeController.weatherModel?.location?.name}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: width * 0.05,
                            ),
                            Center(
                              child: Container(
                                height: height * 0.20,
                                width: width * 0.5,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage('https:${homeController.weatherModel?.current?.condition!.icon}'), fit: BoxFit.fill),
                                ),
                              ),
                            ),
                            Center(
                                child: Text("${homeController.weatherModel?.current?.condition?.text}", style: const TextStyle(color: AppColor.whiteColor, fontWeight: FontWeight.bold, fontSize: 20))),
                            SizedBox(height: height * 0.05),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //Temperature Widget
                                  Container(
                                    height: height * 0.09,
                                    width: width * 0.3,
                                    margin: const EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Temp",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Text("${homeController.weatherModel?.current?.tempC}º",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                            )),
                                      ],
                                    ),
                                  ),
                                  //Wind Widget
                                  Container(
                                    height: height * 0.09,
                                    width: width * 0.3,
                                    margin: const EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Wind",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Text("${homeController.weatherModel?.current?.windKph}km/h",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                            )),
                                      ],
                                    ),
                                  ),
                                  //Humidity Widget
                                  Container(
                                    height: height * 0.09,
                                    width: width * 0.3,
                                    margin: const EdgeInsets.all(5),
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Humidity",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Text(
                                          "${homeController.weatherModel?.current?.humidity}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Text("Today",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              height: width * 0.02,
                            ),
                            SizedBox(
                              height: height * 0.23,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: homeController.weatherModel?.forecast?.forecastday?.length,
                                itemBuilder: (context, index) {
                                  var data = homeController.weatherModel?.forecast?.forecastday?[index];
                                  return Row(
                                    children: data?.hour?.map((hourData) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Container(
                                              width: 150,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColor.lightBlueColor),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text(
                                                      hourData.time?.split(' ').last ?? '',
                                                      textAlign: TextAlign.center,
                                                      style: const TextStyle(color: AppColor.whiteColor),
                                                    ),
                                                    Text(
                                                      '${hourData.tempC?.toStringAsFixed(1) ?? ''} °C',
                                                      textAlign: TextAlign.center,
                                                      style: const TextStyle(color: AppColor.whiteColor),
                                                    ),
                                                    Text(
                                                      hourData.condition?.text ?? '',
                                                      textAlign: TextAlign.center,
                                                      style: const TextStyle(color: AppColor.whiteColor),
                                                    ),
                                                    Image.network('https:${hourData.condition?.icon ?? ''}', height: 50, width: 50),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList() ??
                                        [],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
              ))),
    );
  }
}
