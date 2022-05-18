import 'package:flutter/cupertino.dart';

class Convertor {
  static convert(uValue, rValue, num1, GlobalKey<FormState> form) {
    if (form.currentState!.validate()) {
      if (uValue == 'Km' || uValue == 'm' || uValue == 'cm') {
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
        } else if (uValue == 'Km' && rValue == 'cm') {
          double result = double.parse(num1) * 100000;
          return result;
        }
      }
      else if (uValue == 'l' || uValue == 'ml') {
        if (uValue == 'l' && rValue == 'ml') {
          double result = double.parse(num1) * 1000;
          return result;
        } else if (uValue == 'ml' && rValue == 'l') {
          double result = double.parse(num1) / 1000;
          return result;
        }
      }
      else if (uValue == 'Kg' || uValue == 'g' || uValue == 'mg') {
        if (uValue == 'Kg' && rValue == 'g') {
          double result = double.parse(num1) * 1000;
          return result;
        } else if (uValue == 'g' && rValue == 'Kg') {
          double result = double.parse(num1) / 1000;
          return result;
        } else if (uValue == 'g' && rValue == 'mg') {
          double result = double.parse(num1) * 1000;
          return result;
        } else if (uValue == 'mg' && rValue == 'g') {
          double result = double.parse(num1) / 1000;
          return result;
        }
        var result = 'result';
        return result;
      }
    }
  }
}
