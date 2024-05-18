import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_model.dart';

class FutureForecastListItem extends StatelessWidget {
  final Forecastday? forecastday;
  const FutureForecastListItem({super.key, this.forecastday});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: [
          Image.network("http:${forecastday?.day?.condition?.icon ?? ""}"),
          Expanded(
            child: Text(
              DateFormat.MMMEd()
                  .format(DateTime.parse(forecastday?.date.toString() ?? "")),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14
              ),
            ),
          ),
          Expanded(
            child: Text(forecastday?.day?.condition?.text ?? " ",style: TextStyle(color: Colors.white,fontSize: 15),),
          ),
          Expanded(
            child: Text("^${forecastday?.day?.maxtempC?.round()}/${forecastday?.day?.mintempC?.round()}",style: TextStyle(color: Colors.white,fontSize: 15),),)
        ],
      ),
    );
  }
}
