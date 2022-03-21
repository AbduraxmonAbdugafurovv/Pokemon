import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokemon/models/pokemon_model.dart';

class PokemonService {
  static Future<PokemonModel> getPokemon() async {
    Response response = await Dio().get(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    return PokemonModel.fromJson(jsonDecode(response.data));
  }
}
