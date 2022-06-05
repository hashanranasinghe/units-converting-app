

import 'package:flutter/material.dart';
import 'package:units_conversions/class/Validator.dart';
import 'package:units_conversions/widget/constant.dart';
import 'package:units_conversions/widget/dropdownbtn.dart';

import '../class/Convertor.dart';


class ConvertingScreen extends StatefulWidget {
  const ConvertingScreen({Key? key}) : super(key: key);
  static const routName = 'converting-screen';

  @override
  State<ConvertingScreen> createState() => _ConvertingScreenState();
}

class _ConvertingScreenState extends State<ConvertingScreen> {
  // final units = ['Km','m','cm','l','ml','Kg','mg','g'];
  List<String> units = [];
  final selectUnits = ['Length','Liquid','Mars','Bytes'];
  String? selectValue;
  List<String> units2 = [];
  String? value;
  String? resultValue;
  String? result;
  TextEditingController enterValue = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool isSelect = true;
  bool isSelectValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _form,
          child: Container(

            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Select the unit',style: TextStyle(
                    fontSize: 25,
                    color: forth
                  ),),
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: CustomDropDownButton(
                      valueList: selectUnits.map(buildMenuUnit).toList(),
                      function: (selectValue)=>
                          setState(() {
                            this.selectValue = selectValue;
                            isSelectValue = false;
                            units = Validator.selectValue(selectValue);
                          }),
                    text: selectValue ,
                  height: 50,
                  width: 120,),
                ),




                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child:_buildValue(),),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: CustomDropDownButton(
                        valueList: units.map(buildMenuUnit).toList(),
                        function: (value)=>
                            setState(() {
                              this.value = value;
                              print(value);
                              isSelect = false;
                              units2= Validator.selectUnit(value);
                            }),
                        text: value ,
                        height: 40,
                        width: 120,),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 90),
                      margin: EdgeInsets.only(right: 90),
                      child: Visibility(
                          child:(result == null) ?Expanded(child: Text('result',style:
                            TextStyle(
                              fontSize: 20,
                              color: forth
                            ),))
                              :Expanded(child: Text("$result")),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: CustomDropDownButton(
                        valueList: units2.map(buildMenuUnit).toList(),
                        function: isSelect ?
                        null : (resultValue)=>
                            setState(() {
                              this.resultValue = resultValue;

                            }),
                        text: resultValue ,
                        height: 40,
                        width: 120,),
                    ),
                  ],
                ),
                Container(
                  width: 200,
                  child: TextButton(
                      onPressed: (){

                        var r = Convertor.convert(value, resultValue, enterValue.text,_form);
                          print(value);
                          print(resultValue);
                          print(enterValue.text);
                          setState(() {
                            result = r.toString();
                          });
                          print(result);

                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 6, horizontal: 6),
                        width: double.infinity,
                        child: const Center(
                          child: Text(
                            'Convert',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                            fontSize: 20),
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          backgroundColor: MaterialStateProperty.all(primary))),
                )

              ],
            ),
          ),
        ),
      ),
    );

  }
  DropdownMenuItem<String> buildMenuUnit(String unit)=>
      DropdownMenuItem(
        value: unit,
        child: Text(unit,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),);

  DropdownMenuItem<String> buildMenuResultUnit(String unit)=>
      DropdownMenuItem(value: unit, child: Text(
        unit,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),
      ),);




  Widget _buildValue(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: TextFormField(
        controller: enterValue,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        validator: (value){
          return Validator.enterValue(value);
        },
        decoration: InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            hintText: "Enter value",
            hintStyle: TextStyle(
                  color: third,
                  fontSize: 20
            ),
            fillColor: second,
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );

  }


}
