import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:launcher_new/widgets/apihttp.dart';
import 'package:launcher_new/widgets/weatherModel.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("${snapshot.hasError}");
        }
        if (snapshot.hasData) {
          WeatherModel? w1 = snapshot.data! as WeatherModel?;
          return Column(
            children: [
              Center(
                    child: Text(
                      "${w1!.name}",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                      ),
                    ),
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  
                  Text(
                    (w1!.main!.temp! - 273).toStringAsFixed(0),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 90,
                        fontWeight: FontWeight.w500),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 72),
                    child: Text(
                      ".",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 75),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 11),
                    child: Text(
                      "c",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 45),
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text(
                    "${w1.weather![0].description}",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${DateTime.now().weekday == 1 ? "Monday" : ""}${DateTime.now().weekday == 2 ? "Tuesday" : ""}${DateTime.now().weekday == 3 ? "Wednesday" : ""}${DateTime.now().weekday == 4 ? "Thursday" : ""}${DateTime.now().weekday == 5 ? "Friday" : ""}${DateTime.now().weekday == 6 ? "Saturday" : ""}${DateTime.now().weekday == 7 ? "Sunday" : ""} ,${DateTime.now().day} ${DateTime.now().month == 1 ? "Jan" : ""}${DateTime.now().month == 2 ? "Feb" : ""}${DateTime.now().month == 3 ? "Mar" : ""}${DateTime.now().month == 4 ? "Apr" : ""}${DateTime.now().month == 4 ? "May" : ""}${DateTime.now().month == 6 ? "Jun" : ""}${DateTime.now().month == 7 ? "July" : ""}${DateTime.now().month == 8 ? "Aug" : ""}${DateTime.now().month == 9 ? "Sep" : ""}${DateTime.now().month == 10 ? "Oct" : ""}${DateTime.now().month == 11 ? "Nov" : ""}${DateTime.now().month == 12 ? "Dec" : ""} ",
                      style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
                        Container(
                            height: 0.7,
                            width: 300,
                            color: Colors.white70),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Icon(Icons.air,
                                        color: Colors.white70),
                                    const SizedBox(height: 5),
                                    Text(
                                      "${(w1.wind!.speed)!.toStringAsFixed(1)} km/h",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    const Text(
                                      "Wind",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Icon(Icons.water_drop_rounded,
                                        color: Colors.white70),
                                    const SizedBox(height: 5),
                                    Text(
                                      "${(w1.main!.humidity)!.toStringAsFixed(0)}%",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    const Text(
                                      "Humidity",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Icon(Icons.cloud_queue_rounded,
                                        color: Colors.white70),
                                    const SizedBox(height: 5),
                                    Text(
                                      "${(100 - w1.clouds!.all!).toStringAsFixed(0)}%",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    const Text(
                                      "Chance of rain",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
            ],
          );
        }

        return CircularProgressIndicator();
      },
      future: ApiHttp.apiHttp.getData('Bhilai'),
    );
  }
}
