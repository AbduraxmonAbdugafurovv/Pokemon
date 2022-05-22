
  import 'package:flutter/material.dart';
import 'package:pokemon/core/constant/constant.dart';
import 'package:pokemon/core/extension/mediaqury_context_ext.dart';

Container pokemonButton(BuildContext context, text, color) {
    return Container(
      alignment: Alignment.center,
      width: context.width * 0.42,
      height: context.height * 0.042,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: FontConst.mediumFont,
            color: ColorConst.white),
      ),
    );
  }
