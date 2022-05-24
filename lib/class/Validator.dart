
class Validator{

static String? enterValue(String? value){
  if(value.toString().isEmpty){
    print('error');
    return "Value cannot be Empty";
  }
  return null;
}

static selectUnit(uValue){
  if(uValue=='Km' || uValue == 'm' || uValue == 'cm'){
    var list = ['Km','m','cm'];
    return list;
  }else if(uValue=='l' || uValue == 'ml'){
    var list = ['l','ml'];
    return list;
  }else if(uValue == 'Kg' || uValue == 'mg' || uValue == 'g'){
    var list = ['Kg','g','mg'];
    return list;
  }else if(uValue == 'B'|| uValue=='KB' || uValue == 'MB' || uValue == 'GB'|| uValue=='TB'){
    var list =['B','KB','MB','GB','TB'];
    return list;
  }
}

static selectValue(sValue){
  if(sValue == 'Length'){
    var list = ['Km','m','cm'];
    return list;
  }else if(sValue == 'Liquid'){
    var list = ['l','ml'];
    return list;
  }else if(sValue == 'Mars'){
    var list=['Kg','g','mg'];
    return list;
  }else if(sValue == 'Bytes'){
    var list =['B','KB','MB','GB','TB'];
    return list;
  }
}



}