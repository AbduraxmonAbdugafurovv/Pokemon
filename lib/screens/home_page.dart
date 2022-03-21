import 'package:flutter/material.dart';
import 'package:pokemon/core/constant/constant.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/service/pokemon_service.dart';
import 'package:pokemon/sizeconfig.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: getHeight(53),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: getHeight(88),
              child: Image.asset("assets/images/pokemon.png"),
            ),
          ),
          SizedBox(
            height: getHeight(31),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(
                  left: getWidht(40),
                  right: getWidht(40),
                  bottom: getHeight(30)),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Buscer pokemon",
                  fillColor: ColorConst.black.withOpacity(0.1),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      getWidht(25),
                    ),
                  ),
                ),
                onChanged: (value){
                  
                },
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidht(17.0)),
              child: FutureBuilder(
                future: PokemonService.getPokemon(),
                builder: ((context, AsyncSnapshot<PokemonModel> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("No Internet"),
                    );
                  } else {
                    var data = snapshot.data!;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: getWidht(19), crossAxisCount: 2),
                      itemBuilder: (context, index) => InkWell(
                        child: Container(
                          width: getWidht(177),
                          height: getHeight(160),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(getHeight(20)),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                  bottom: 0,
                                  width: getWidht(177),
                                  height: getHeight(115.18),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: ColorConst.kPrimaryColor,
                                        borderRadius: BorderRadius.circular(
                                            getHeight(40))),
                                  )),
                              Positioned(
                                bottom: getHeight(59),
                                child: Image.network(
                                    data.pokemon![index].img.toString()),
                              ),
                              Positioned(
                                bottom: getHeight(12.8),
                                child: Container(
                                    alignment: Alignment.center,
                                    width: getWidht(147),
                                    height: getHeight(27.8),
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          103, 103, 103, 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "#${data.pokemon![index].num.toString()}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: ColorConst.kPrimaryColor),
                                        ),
                                        Text(
                                          data.pokemon![index].name.toString(),
                                          style: TextStyle(
                                              color: ColorConst.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, "about",
                              arguments: data.pokemon![index]);
                        },
                      ),
                    );
                  }
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
