import 'package:doctorapp/core/utils/colors_manager.dart';
import 'package:doctorapp/core/utils/txt_style.dart';
import 'package:flutter/material.dart';

class AppTxtField extends StatelessWidget {
  String hintTxt;
  TextEditingController textEditingController;

  AppTxtField({super.key, required this.hintTxt, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: hintTxt,
          hintStyle: TxtStyle.font400size14Grey,
          fillColor:ColorsManager.txtFieldFillColor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: ColorsManager.txtFieldBorderColor,
              )
          )
      ),
    );
  }
}
