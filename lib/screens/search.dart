import 'package:flutter/material.dart';
import 'package:pokemon/core/constant/constant.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/sizeconfig.dart';

class SearchPage extends StatefulWidget {
  List<Pokemon> data;
  SearchPage({Key? key, required this.data}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Set<Pokemon> searchedItems = {};
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as AboutPage;
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: getHeight(53),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: getHeight(88),
            child: Image.asset("assets/images/pokemon.png"),
          ),
          SizedBox(
            height: getHeight(31),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidht(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: const Icon(
                    Icons.chevron_left,
                    size: 32,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: getHeight(42),
                  width: getWidht(228),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Buscar Pokemon",
                        fillColor: ColorConst.black.withOpacity(0.1),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(getWidht(30))),
                        disabledBorder: null),
                    onChanged: (value) {
                      for (Pokemon item in widget.data) {
                        searchedItems.clear();
                        if (value == 0) {
                          searchedItems.clear();
                          setState(() {});
                        } else if (item.name
                            .toString()
                            .toLowerCase()
                            .contains(value.toString().toLowerCase())) {
                          searchedItems.add(item);

                        }
                      }
                    },
                  ),
                ),
                Image.asset("assets/images/setting.png"),
              ],
            ),
          ),
          SizedBox(
            height: getHeight(20),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchedItems.toList().length,
              itemBuilder: ((context, index) => Stack(
                    children: [
                      Positioned(
                        top: getHeight(30),
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: getWidht(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " #${searchedItems.toList()[index].num.toString()}"
                                ,
                                style: TextStyle(
                                    color: ColorConst.kPrimaryColor,
                                    fontSize: getHeight(16),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "#" +
                                searchedItems.toList()[index].name.toString()
                                ,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getHeight(16),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: getWidht(21),
                            right: getHeight(22),
                            top: getHeight(70)),
                        width: getWidht(371),
                        height: getHeight(205),
                        decoration: BoxDecoration(
                            color: ColorConst.kPrimaryColor,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      Positioned(
                        top: 0,
                        left: getWidht(60),
                        right: getWidht(50),
                        child: SizedBox(
                            child: Image.network(searchedItems.toList()[index].img.toString()),
                            ),
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: getHeight(20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidht(24)),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(252, 166, 0, 0.97),
                          borderRadius: BorderRadius.circular(getWidht(10))),
                      height: getHeight(38),
                      width: getWidht(174),
                      child: Text(
                        "Fuego ",
                        style: TextStyle(
                            fontSize: getHeight(15),
                            fontWeight: FontWeight.bold,
                            color: ColorConst.white),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: getHeight(20),
                ),
                Expanded(
                  child: InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 131, 252, 0.46),
                          borderRadius: BorderRadius.circular(getWidht(10))),
                      height: getHeight(38),
                      width: getWidht(174),
                      child: Text(
                        "Volador",
                        style: TextStyle(
                            fontSize: getHeight(15),
                            fontWeight: FontWeight.bold,
                            color: ColorConst.white),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getHeight(25),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: ColorConst.kPrimaryColor,
                  borderRadius: BorderRadius.circular(30)),
            ),
          )
        ],
      ),
    );
  }
}
