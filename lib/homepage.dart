// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:weather_app/service/api_service.dart';
// import 'package:weather_app/ui/components/future_forcast_listitem.dart';
// import 'package:weather_app/ui/components/hourly_weather_list_item.dart';
// import 'package:weather_app/ui/components/todays_weather.dart';
// import 'model/weather_model.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   ApiService apiService = ApiService();
//
//   final _textController=TextEditingController();
//   String searchText="auto:ip";
//
//   _showTextInputDialog(BuildContext context){
//     return showDialog(context: context, builder: (context){
//       return AlertDialog(
//         title: const Text("Search Location :"),
//         content: TextField(
//           controller: _textController,
//           decoration: InputDecoration(hintText: "search by city, zip, lang"),
//         ),
//         actions: [
//           ElevatedButton(onPressed: (){
//             Navigator.pop(context);
//           }, child: const Text("Cancel")),
//           ElevatedButton(onPressed: (){
//
//             if(_textController.text.isEmpty){
//               return;
//             }
//
//             Navigator.pop(context,_textController.text);
//           }, child: Text("Ok")),
//
//         ],
//       );
//     });
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       appBar: AppBar(
//         actions: [
//           IconButton(onPressed: (){
//            String text= _showTextInputDialog(context);
//            setState(() {
//              searchText=text;
//            });
//           }, icon: Icon(Icons.search)),
//           IconButton(onPressed: (){
//
//           }, icon: Icon(Icons.my_location))
//         ],
//         title: const Center(
//             child: Text(
//           "Weather App",
//           style: TextStyle(
//               color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 25),
//         )),
//       ),
//       body: SafeArea(
//         child: FutureBuilder(
//           future: apiService.getWeatherData(searchText),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               WeatherModel? weatherModel = snapshot.data;
//               return SizedBox(
//                   child: Column(
//                 children: [
//                   TodaysWeather(weatherModel: weatherModel),
//                   const SizedBox(
//                     height: 0,
//                   ),
//                   const Text(
//                     "Weather by Hour",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Colors.white),
//                   ),
//                   const SizedBox(height: 2),
//                   SizedBox(
//                     height: 131,
//                     child: ListView.builder(
//                       itemBuilder: (context, index) {
//                         Hour? hour = weatherModel
//                             ?.forecast?.forecastday?[0].hour?[index];
//                         return HourlyWeatherListItem(
//                           hour: hour,
//                         );
//                       },
//                       itemCount:
//                           weatherModel?.forecast?.forecastday?[0].hour?.length,
//                       scrollDirection: Axis.horizontal,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 2,
//                   ),
//                   const Text(
//                     "Next 7 days weather",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25,
//                         color: Colors.white),
//                   ),
//                   SizedBox(height: 2),
//                   Expanded(
//                     child: ListView.builder(
//                       itemBuilder: (context, index) {
//                         Forecastday? forecastday =
//                             weatherModel?.forecast?.forecastday?[index];
//                         return FutureForecastListItem(
//                           forecastday: forecastday,
//                         );
//                       },
//                       itemCount: weatherModel?.forecast?.forecastday?.length,
//                     ),
//                   )
//                 ],
//               ));
//             }
//             if (snapshot.hasError) {
//               return const Center(child: Text("Error occured"));
//             }
//             return const Center(child: CircularProgressIndicator());
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:weather_app/service/api_service.dart';
import 'package:weather_app/ui/components/future_forcast_listitem.dart';
import 'package:weather_app/ui/components/hourly_weather_list_item.dart';
import 'package:weather_app/ui/components/todays_weather.dart';
import 'model/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();

  final _textController = TextEditingController();
  String searchText = "auto:ip";

  _showTextInputDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Search Location :"),
            content: TextField(
              controller: _textController,
              decoration: InputDecoration(hintText: "search by city, zip, lang"),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    if (_textController.text.isEmpty) {
                      return;
                    }
                    Navigator.pop(context, _textController.text);
                  },
                  child: Text("Ok")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                String? text = await _showTextInputDialog(context);
                setState(() {
                  searchText = text ?? searchText;
                });
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                setState(() {
                  searchText="auto:ip";
                });
              },
              icon: Icon(Icons.my_location))
        ],
        title: const Center(
            child: Text(
              "Weather App",
              style: TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 25),
            )),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: apiService.getWeatherData(searchText),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherModel? weatherModel = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    TodaysWeather(weatherModel: weatherModel),
                    const SizedBox(height: 8),
                    const Text(
                      "Weather by Hour",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 131,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          Hour? hour =
                          weatherModel?.forecast?.forecastday?[0].hour?[index];
                          return HourlyWeatherListItem(hour: hour);
                        },
                        itemCount: weatherModel
                            ?.forecast?.forecastday?[0].hour?.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Next 7 days weather",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,  // Add shrinkWrap to prevent overflow
                      physics: NeverScrollableScrollPhysics(),  // Prevent scrolling conflict
                      itemBuilder: (context, index) {
                        Forecastday? forecastday =
                        weatherModel?.forecast?.forecastday?[index];
                        return FutureForecastListItem(forecastday: forecastday);
                      },
                      itemCount: weatherModel?.forecast?.forecastday?.length,
                    )
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Error occurred"));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}