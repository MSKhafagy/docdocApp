import 'package:doctorapp/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class TxtStyle {
  static TextStyle font200Size35Black = TextStyle(
    fontWeight: FontWeight.w200,
    fontSize: 35,
    color: Colors.black,
  );

  static TextStyle font700Size32blue = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 32,
    color: ColorsManager.primaryColor,
  );

  static TextStyle font400Size10grey = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: ColorsManager.grey,
  );

  static const TextStyle font600size16White = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: ColorsManager.white
  );
  static const TextStyle font700size24Blue = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: ColorsManager.primaryColor
  );

  static const TextStyle font400size14Grey = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: ColorsManager.grey
  );
  static const TextStyle font500size14Grey = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: ColorsManager.grey
  );

  static const TextStyle font700size18Black = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: ColorsManager.textBlack,
  );
  static const TextStyle font600size18Black = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorsManager.textMoreBlack,
  );
  static const TextStyle font400size12Blue = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorsManager.primaryColor,
  );

  static const TextStyle font400size11Black = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: ColorsManager.textHome,
  );
}