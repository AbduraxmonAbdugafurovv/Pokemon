import 'package:flutter/material.dart';
import 'package:pokemon/core/extension/mediaqury_context_ext.dart';

import '../constant/constant.dart';

Positioned pokemon_bakc(BuildContext context) {
  return Positioned(
    top: context.height * 0.1,
    left: context.width * 0.05,
    child: Container(
      height: context.height * 0.24,
      width: context.width * 0.9,
      decoration: BoxDecoration(
        color: ColorConst.kPrimaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}
