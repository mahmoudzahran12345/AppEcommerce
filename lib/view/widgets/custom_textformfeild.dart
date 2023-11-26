import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import 'custom_text.dart';

class CustomTextFormFeild extends StatelessWidget {
  final String text;
  final String hint;
  final Function onSaved;
  final Function validation;


   CustomTextFormFeild(this.text, this.hint, this.onSaved, this.validation, {super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child:  Column(
        children: [
          CustomText(text: text, size: 14, color: Colors.grey,alignment: Alignment.topLeft,),
           TextFormField(
            decoration: InputDecoration(
              focusedBorder:  const UnderlineInputBorder(
                borderSide: BorderSide(color: primaryColor,width: 2),
              ),
              border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor)
              ),
                hintText: hint,
                hintStyle: const TextStyle(
                  color: secondColor,

                ),
            ),
             onSaved:(input) => onSaved(input) ,
             validator:(input) => validation(input) ,

          )
        ],
      )
      ,
    );
  }
}
