import 'package:flutter/material.dart';
import 'package:pokemon/core/constant/constant.dart';
import 'package:pokemon/core/extension/mediaqury_context_ext.dart';
import 'package:pokemon/models/pokemon_model.dart';

Positioned info_pokemon(BuildContext context, List<Pokemon> data, int index) {
  return Positioned(
    top: context.height * 0.146,
    left: context.width * 0.028,
    width: context.width * 0.36,
    height: context.height * 0.035,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff676767),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              "#${data[index].num.toString()}",
              style: TextStyle(
                fontSize: FontConst.mediumFont,
                color: ColorConst.kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              data[index].name.toString(),
              style: TextStyle(
                fontSize: FontConst.smallFont,
                fontWeight: FontWeight.bold,
                color: ColorConst.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
