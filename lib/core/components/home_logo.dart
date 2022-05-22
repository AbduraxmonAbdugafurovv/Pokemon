 import 'package:flutter/material.dart';
import 'package:pokemon/core/extension/mediaqury_context_ext.dart';

  Center logo_pokemon(BuildContext context) {
    return Center(
          child: SizedBox(
            height:context.height*0.1 ,
            width: context.width*0.8,
            child: Image.asset("assets/images/pokemon.png"),),
        );
  }