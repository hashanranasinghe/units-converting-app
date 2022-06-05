import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class CustomDropDownButton extends StatefulWidget {
  final String? text;
  final double? height;
  final double? width;
  final List<DropdownMenuItem<String>> valueList;
  final Function(String?)? function;
  const CustomDropDownButton({Key? key,
    required this.valueList,
    required this.function, this.text,
    this.height,
    this.width}) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: third,
      ),
      child: DropdownButton<String>(
        underline: Container(color: Colors.transparent),
        hint: Text('Select',style: TextStyle(
            color: second,
            fontWeight: FontWeight.bold
        ),),
        iconEnabledColor: Colors.white,
        iconDisabledColor: second,
        dropdownColor: forth,
        items: widget.valueList,
        onChanged: (value){
          widget.function!(value!);
        },
        value: widget.text,
      ),
    );
  }
}
