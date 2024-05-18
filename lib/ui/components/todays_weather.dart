import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/print_utils.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_model.dart';

// class TodaysWeather extends StatelessWidget {
//   final WeatherModel? weatherModel;
//   const TodaysWeather({super.key, required this.weatherModel});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         WeatherBg(
//             weatherType: WeatherType.cloudyNight,
//             width: double.infinity,
//             height: 290),
//         SizedBox(
//           width: double.infinity,
//           height: 290,
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(2),
//                 decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(8)),
//                 child: Column(
//                   children: [
//                     Text(
//                       weatherModel?.location?.name ?? "",
//                       style: const TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                     Text(
//                       DateFormat.yMMMMEEEEd().format(DateTime.parse(
//                           weatherModel?.current?.lastUpdated.toString() ?? "")),
//                       style: const TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white70),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 0,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 5.0),
//                 child: Row(
//                   children: [
//                     Container(
//                         decoration: const BoxDecoration(
//                             shape: BoxShape.circle, color: Colors.white10),
//                         child: Image.network(
//                             "https:${weatherModel?.current?.condition?.icon ?? ""}")),
//                     const Spacer(),
//                     Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 7.0),
//                               child: Text(
//                                 weatherModel?.current?.tempC
//                                         ?.round()
//                                         .toString() ??
//                                     "",
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 40,
//                                     color: Colors.black87),
//                               ),
//                             ),
//                             const Text(
//                               "o",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.yellowAccent),
//                             )
//                           ],
//                         ),
//                         Text(
//                           weatherModel?.current?.condition?.text ?? "",
//                           style: TextStyle(color: Colors.white, fontSize: 20),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 110,
//                 margin: EdgeInsets.all(5),
//                 padding: EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                     color: Colors.white10,
//                     borderRadius: BorderRadius.circular(30)),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Column(
//                           children: [
//                             const Text(
//                               "Feels Like",
//                               style: TextStyle(
//                                 fontSize:15,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Text(
//                               weatherModel?.current?.feelslikeC
//                                       ?.round()
//                                       .toString() ??
//                                   "",
//                               style: const TextStyle(
//                                   fontSize: 15, fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                         //
//                         Column(
//                           children: [
//                             const Text(
//                               "Wind",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Text(
//                               "${weatherModel?.current?.windKph
//                                   ?.round()}km/h",
//                               style: const TextStyle(
//                                   fontSize: 15, fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         )
//
//                       ],
//                     ),
//                     //
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Column(
//                           children: [
//                             const Text(
//                               "Humdity",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Text(
//                                 "${weatherModel?.current?.humidity
//                                     ?.round()
//                                     .toString() ??
//                                     ""}%",
//                                   style: const TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold),
//                               )
//                           ],
//                         ),
//                         //
//                         Column(
//                           children: [
//                             const Text(
//                               "Visibility",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Text(
//                               "${weatherModel?.current?.visKm
//                                   ?.round()}km/h",
//                               style: const TextStyle(
//                                   fontSize: 15, fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         )
//
//                       ],
//                     )
//                     //Text(weatherModel?.current?.feelslikeC.do ?? "",),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
class TodaysWeather extends StatelessWidget {
  final WeatherModel? weatherModel;

  const TodaysWeather({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(
            weatherType: WeatherType.sunny,
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 300),
        SizedBox(
          width: double.infinity,
          height: 300,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Text(
                      weatherModel?.location?.name ?? "",
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      DateFormat.yMMMMEEEEd().format(DateTime.parse(
                          weatherModel?.current?.lastUpdated.toString() ?? "")),
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white10),
                        child: Image.network(
                            "https:${weatherModel?.current?.condition?.icon ??
                                ""}")),
                    const Spacer(),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 7.0),
                              child: Text(
                                weatherModel?.current?.tempC
                                    ?.round()
                                    .toString() ??
                                    "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.black87),
                              ),
                            ),
                            const Text(
                              "o",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellowAccent),
                            )
                          ],
                        ),
                        Text(
                          weatherModel?.current?.condition?.text ?? "",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10)
                  ],
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Feels Like",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              weatherModel?.current?.feelslikeC
                                  ?.round()
                                  .toString() ??
                                  "",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              "Wind",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${weatherModel?.current?.windKph?.round()} km/h",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Humidity",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${weatherModel?.current?.humidity?.round() ??
                                  ""}%",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              "Visibility",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${weatherModel?.current?.visKm?.round()} km",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}