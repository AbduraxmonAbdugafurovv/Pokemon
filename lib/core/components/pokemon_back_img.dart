import 'package:flutter/material.dart';
import 'package:pokemon/core/extension/mediaqury_context_ext.dart';
import 'package:pokemon/models/pokemon_model.dart';

Positioned pokemon_img(BuildContext context, Pokemon data, ) {
  return Positioned(
    left: context.width * 0.1,
    height: context.height * 0.3,
    width: context.width * 0.8,
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            data.img.toString(),
          ),
        ),
      ),
    ),
  );
}
