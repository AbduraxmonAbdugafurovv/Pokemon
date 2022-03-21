import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/screens/search.dart';
import 'package:pokemon/screens/home_page.dart';

class MyRoute{
   Route? onGenerateRoute(RouteSettings settings){
    var args= settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) =>const HomePage());
      case "about":
      return MaterialPageRoute(builder: (context) =>SearchPage(data: args as List<Pokemon>));
    }
    return null;
    
  }
}