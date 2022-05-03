import 'package:flutter/cupertino.dart';


class Convertor{

  static convert(uValue, rValue,num1,GlobalKey<FormState> form) {

  if(form.currentState!.validate()) {

    if (uValue == 'Km' && rValue == 'm') {
      var result = double.parse(num1) * 1000;
      return result;
    } else if (uValue == 'm' && rValue == 'Km') {
        double result = double.parse(num1) / 1000;
        return result;
    } else if (uValue == 'm' && rValue == 'cm') {
        double result = double.parse(num1) * 100;
        return result;
    } else if (uValue == 'cm' && rValue == 'm') {
        double result = double.parse(num1) / 100;
        return result;
    }else if(uValue=='l' && rValue == 'ml'){
      double result = double.parse(num1) * 1000;
      return result;
    }

  }
  var result = 'result';
  return result;
  }


}