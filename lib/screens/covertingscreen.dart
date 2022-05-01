import 'package:flutter/material.dart';

import '../Convert.dart';


class ConvertingScreen extends StatefulWidget {
  const ConvertingScreen({Key? key}) : super(key: key);
  static const routName = 'converting-screen';

  @override
  State<ConvertingScreen> createState() => _ConvertingScreenState();
}

class _ConvertingScreenState extends State<ConvertingScreen> {
  final units = ['Km','m'];
  String? value;
  String? resultValue;
  String? result;
  TextEditingController enterValue = TextEditingController();
  final Convertor convertor = Convertor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child:_buildValue(),),

                DropdownButton<String>(
                  items: units.map(buildMenuUnit).toList(),
                  onChanged: (value)=> setState(()=>
                    this.value = value),
                  value: value,
                ),



              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text('$result')),

                DropdownButton<String>(
                  items: units.map(buildMenuUnit).toList(),
                  onChanged: (resultValue)=> setState(()=>
                  this.resultValue = resultValue),
                  value: resultValue,
                ),



              ],
            ),
            TextButton(
                onPressed: (){
                    var r = _convert(value, resultValue, enterValue.text);
                    print(value);
                    print(resultValue);
                    print(enterValue.text);
                    setState(() {
                      result = r;
                    });

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
        decoration: InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            hintText: "Enter value",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );

  }

  static _convert(uValue,rValue,num1){
    if(uValue == 'Km' && rValue == 'm'){
      var num  = int.parse(num1);

      var r = num * 1000;
      var result = r.toString();
      return result;
    }
  }
}
