import 'package:flutter/material.dart';
import 'package:pokemon/core/constant/constant.dart';
import 'package:pokemon/core/extension/mediaqury_context_ext.dart';

Positioned backround_pokemon(BuildContext context) {
  return Positioned(
    top: context.height * 0.0619,
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(7, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: ColorConst.kPrimaryColor,
      ),
      height: context.height * 0.13,
      width: context.width * 0.42,
    ),
  );
}
