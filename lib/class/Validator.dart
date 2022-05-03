
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
  }else if(uValue=='l'){
    var list = ['ml'];
    return list;
  }
}



}