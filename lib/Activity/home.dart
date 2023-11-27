import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController searchController=new TextEditingController();
  @override
  void initState() {
    super.initState();

    print("This is a init state");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("set state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("State Disposed");
  }

  @override
  Widget build(BuildContext context) {
    var city_name = ["Islamabad", "Lahore", "Karachi", "Hyderabad", "London"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    Map<dynamic, dynamic>? info =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
       String temp=((info?['temp_value']).toString());
       String air=((info?['air_speed_value']).toString());
       if(temp=="NA"){
         print("NA");
       }else
         {
           temp=((info?['temp_value']).toString()).substring(0,4);
          air=((info?['air_speed_value']).toString()).substring(0,4);
         }
       String icon=info?['icon_value'];
       String getcity=info?['city_value'];
       String hum=info?['hum_value'];
       String des=info?['des_value'];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.lightBlueAccent,
        ),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                //  stops: [
                //    0.1,
                //    0.3
                //  ],
                colors: [Colors.blue, Colors.blueAccent])),
            child: Column(
              children: [
                Container(
                  //search wala container

                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 23, vertical: 27),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if((searchController.text).replaceAll("","")=="")
                          {
                            print("Blank Search");
                          }else{
                            Navigator.pushReplacementNamed(context,"/loading",arguments: {
                              "searchText":searchController.text,
                            });
                          }

                        },
                        child: Container(
                          child: Icon(Icons.search),
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Search $city"),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(18),
                        child: Row(
                          children: [
                            Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Text("$des",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                Text("$getcity",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                              ],
                            )
                          ],
                        )),
                      ),

                  ],
                ),
                 Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 260,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    child:
                                    Text("$temp",style: TextStyle(fontSize: 90),),
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),

                                ),
                                Text("C",style: TextStyle(fontSize: 40),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: EdgeInsets.fromLTRB(21, 0, 20, 0),
                        padding: EdgeInsets.all(18),
                        height: 180,
                        child:Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.windy),

                              ],
                            ),
                            SizedBox(height: 18,),
                            Text("$air",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            Text("km/hr")
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: EdgeInsets.fromLTRB(10, 0, 28, 0),
                        padding: EdgeInsets.all(20),
                        height: 180,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),

                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("$hum",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            Text("Percent")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60,),
                Container(
                  padding: EdgeInsets.all(35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made by Areesha"),
                      Text("Data Provided By Openweathermap.org")
                    ],
                  ),
                )

            ]),
          ),
        ),
      ));

  }
}
