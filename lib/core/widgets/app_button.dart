import 'package:doctorapp/core/utils/txt_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  Function function;
  String buttonTxt;

  AppButton({super.key,required this.function, required this.buttonTxt});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function(),

      child: Container(
        width: 327,
        height: 52,
        decoration: BoxDecoration(
            color: Color.fromRGBO(36, 124, 255, 1),
            borderRadius: BorderRadius.circular(16)
        ),
        child: Center(child: Text(buttonTxt, style: TxtStyle.font600size16White)),
      ),
    );
  }
}
