import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_model.dart';

class HourlyWeatherListItem extends StatelessWidget {
  final Hour? hour;
  const HourlyWeatherListItem({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(5),
      width: 120,

      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    hour?.tempC?.round().toString() ?? "",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(width: 1,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 9.0),
                  child: Text(
                    "o",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,color: Colors.indigo
            ),
            child: Image.network("https:${hour?.condition?.icon ?? ""}"),
          ),
          Text(DateFormat.j().format(DateTime.parse(hour?.time?.toString() ?? "")),style: TextStyle(color: Colors.white,fontSize: 17,),),
        ],
      ),
    );
  }
}
