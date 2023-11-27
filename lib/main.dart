import 'package:flutter/material.dart';
import 'package:mousam/Activity/home.dart';
import 'package:mousam/Activity/loading.dart';
void main() {
  runApp(MaterialApp(
    routes:{
      "/": (context) => Loading(),
      "/home": (context) =>  Home(),
      "/loading":(context)=> Loading(),
    },

  ));
}
