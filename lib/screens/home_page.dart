import 'package:flutter/material.dart';
import 'package:pokemon/core/components/backround_pokemon.dart';
import 'package:pokemon/core/components/home_logo.dart';
import 'package:pokemon/core/components/info_pokemon.dart';
import 'package:pokemon/core/components/pokemon_img.dart';
import 'package:pokemon/core/constant/constant.dart';
import 'package:pokemon/core/extension/mediaqury_context_ext.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/service/pokemon_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _key = GlobalKey();
  Set<Pokemon> pokemons = {};
  bool changed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: context.height * 0.04,
          ),
          logo_pokemon(context),
          Expanded(
            child: FutureBuilder(
              future: PokemonService.getPokemon(),
              builder: (context, AsyncSnapshot<PokemonModel> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("No internet"),
                  );
                } else {
                  var data = snapshot.data!.pokemon;
                  // print(data![0].name);
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: context.height * 0.04,
                            horizontal: context.width * 0.1),
                        child: TextField(
                          controller: _controller,
                          key: _key,
                          decoration: InputDecoration(
                            hintText: "Buskar Pokemon",
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onChanged: (value) {
                            for (var item in data!) {
                              if (value.isEmpty) {
                                pokemons.clear();
                                setState(() {});
                              } else if (item.name
                                  .toString()
                                  .toLowerCase()
                                  .contains(value.toString().toLowerCase())) {
                                // print(item.name);
                                pokemons.add(item);
                                setState(() {});
                              }
                            }
                          },
                        ),
                      ),
                      pokemons.isNotEmpty
                          ? Expanded(
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 22,
                                    mainAxisSpacing: 5,
                                    crossAxisCount: 2,
                                  ),
                                  itemCount: pokemons.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      child: pokemon(
                                          context, pokemons.toList(), index),
                                        onTap: (){
                                          Navigator.pushNamed(context, "about",arguments:pokemons.toList()[index] );
                                        },
                                    );

                                  }),
                            )
                          : Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 22),
                                child: GridView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: data!.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 22,
                                    mainAxisSpacing: 5,
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      child: pokemon(context, data, index),
                                      onTap: () {
                                        Navigator.pushNamed(context, "about",
                                            arguments: index);
                                      },
                                    );
                                  },
                                ),
                              ),
                            )
                    ],
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  SizedBox pokemon(BuildContext context, List<Pokemon> data, int index) {
    return SizedBox(
      child: Stack(
        children: [
          backround_pokemon(context),
          info_pokemon(context, data, index),
          pokemonImg(context, data, index),
        ],
      ),
    );
  }

  searchView() {
    Container(
      height: context.height * 0.1,
      width: context.width * 0.1,
      color: ColorConst.kPrimaryColor,
    );
  }
}
