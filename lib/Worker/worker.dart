import 'dart:convert';

import 'package:http/http.dart';

class worker
{
  String location;
  //Constructor
  worker({required this.location})
  {
    location=this.location;
  }

  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  String icon="03n";

  //method
  Future<void> getData() async {
    try {
      String urlString = "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=cbf5380aeaf40ea96ce052dc6902e13f";
      Uri uri = Uri.parse(urlString);
      Response response = await get(uri);
      Map data = jsonDecode(response.body);
      print(data);

      //Getting temp,humidity
      Map temp_data = data['main'];
      double getTemp = temp_data['temp']-273.15;
      String getHumidity = temp_data['humidity'].toString();

      //Getting air_speed
      Map wind = data['wind'];
      double getAir_speed = wind["speed"]/0.27777777777778;

      //Getting description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data['description'];




      //Assigning values
      temp = getTemp.toString(); //C
      humidity = getHumidity;   //%
      air_speed = getAir_speed.toString();  //km/hr
      description = getDesc;
      main = getMain_des;
      icon= weather_main_data["icon"].toString();
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description ="Can't find data";
      main = "NA";
      icon="09d";
    }
  }
}