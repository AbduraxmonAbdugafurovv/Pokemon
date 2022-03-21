import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/screens/about_page.dart';
import 'package:pokemon/screens/home_page.dart';

class MyRoute{
   Route? onGenerateRoute(RouteSettings settings){
    var args= settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) =>const HomePage());
      case "about":
      return MaterialPageRoute(builder: (context) =>AboutPage());
    }
    return null;
    
  }
}