import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';
import 'custom_text.dart';
class CustomButtonMedia extends StatelessWidget {
  final VoidCallback function;
  final double width;
  final double height;
  final String text ;
  final double size;
  final Alignment alignment;
  final String imageName;

  const CustomButtonMedia(this.function, this.width, this.height, this.text,
      this.size, this.alignment, this.imageName, {super.key});
  @override
  Widget build(BuildContext context) {
    return   MaterialButton( 
      onPressed: function,
      child: Container(
          width: width,
          height: height,
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade100
          ),
          child:  Row(
            children: [
              Image.asset(imageName),
              const SizedBox(width: 90.0,),
               CustomText(text: text, size: size, color: secondColor,alignment: alignment),


            ],
          )
      ),

    );

  }
}
