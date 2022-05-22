import 'package:flutter/material.dart';
import 'package:pokemon/core/components/home_logo.dart';
import 'package:pokemon/core/components/pokemon_back.dart';
import 'package:pokemon/core/components/pokemon_back_img.dart';

import 'package:pokemon/core/components/pokemon_button.dart';
import 'package:pokemon/core/constant/constant.dart';
import 'package:pokemon/core/extension/mediaqury_context_ext.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/service/pokemon_service.dart';

// ignore: must_be_immutable
class AboutPage extends StatefulWidget {
  Pokemon? pokemon;
  AboutPage({required this.pokemon, Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: PokemonService.getPokemon(),
          builder: (context, AsyncSnapshot<PokemonModel> snap) {
            if (!snap.hasData) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snap.hasError) {
              return const Center(
                child: Text("No internet"),
              );
            } else {
              var data = widget.pokemon;
              return Column(
                children: [
                  SizedBox(
                    height: context.height * 0.04,
                  ),
                  logo_pokemon(context),
                  SizedBox(
                    height: context.height * 0.1,
                  ),
                  SizedBox(
                    height: context.height * 0.34,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          top: context.height * 0.05,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "#" + data!.num.toString(),
                                  style: TextStyle(
                                      fontSize: FontConst.largeFont,
                                      color: ColorConst.kPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: context.width * 0.5,
                                ),
                                Text(
                                 data.name.toString(),
                                  style: TextStyle(
                                      fontSize: FontConst.largeFont,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConst.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        pokemon_bakc(context),
                        pokemon_img(context, data),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        pokemonButton(context, "Fuego",
                            const Color.fromRGBO(252, 166, 0, 0.97)),
                        pokemonButton(context, "Volador",
                            const Color.fromRGBO(0, 131, 252, 0.46)),
                      ],
                    ),
                  )
                ],
              );
            }
          }),
    );
  }
}
