

import 'package:flutter/material.dart';
import 'package:units_conversions/class/Validator.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Select the unit'),
              DropdownButton<String>(
                items: selectUnits.map(buildMenuUnit).toList(),
                onChanged: (selectValue)=>
                    setState(() {
                      this.selectValue = selectValue;
                      isSelectValue = false;
                      units = Validator.selectValue(selectValue);
                    }),
                value: selectValue,
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child:_buildValue(),),

                  DropdownButton<String>(
                    items: units.map(buildMenuUnit).toList(),
                    onChanged: (value)=>
                    setState(() {
                      this.value = value;
                      print(value);
                      isSelect = false;
                      units2= Validator.selectUnit(value);
                    }),
                    value: value,
                  ),



                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                      child:(result == null) ?Expanded(child: Text('result'))
                          :Expanded(child: Text("$result")),
                  ),



                  DropdownButton<String>(
                    items: units2.map(buildMenuUnit).toList(),
                    onChanged: isSelect ?
                        null
                    : (resultValue)=>
                        setState(() {
                          this.resultValue = resultValue;

                        }),
                    value: resultValue,
                  ),



                ],
              ),
              TextButton(
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
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27),
                          )),
                      backgroundColor: MaterialStateProperty.all(
                          const Color(0xff102248))))

            ],
          ),
        ),
      ),
    );

  }
  DropdownMenuItem<String> buildMenuUnit(String unit)=>
      DropdownMenuItem(value: unit, child: Text(
        unit,

        style: TextStyle(
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
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );

  }


}
