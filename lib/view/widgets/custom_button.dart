import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback function;
  final double width;
  final double height;
  final String text ;
  final double size;
  final Alignment alignment;

   const CustomButton(this.function, this.width, this.height, this.text, this.size,
      this.alignment, {super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: MaterialButton(
        onPressed: function,
        child: Container(
          width: width,
          height: height,
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: primaryColor
          ),
          child:  CustomText(text: text, size: size, color: whiteColor,alignment: alignment,),
        ),

      ),
    );

  }
}
