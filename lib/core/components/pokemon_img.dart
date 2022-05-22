import 'package:flutter/material.dart';
import 'package:pokemon/core/extension/mediaqury_context_ext.dart';
import 'package:pokemon/models/pokemon_model.dart';

Positioned pokemonImg(BuildContext context, List<Pokemon> data, int index) {
  return Positioned(
    bottom: context.height * 0.06,
    left: context.width * 0.06,
    child: Image.network(
      data[index].img.toString(),
    ),
  );
}
