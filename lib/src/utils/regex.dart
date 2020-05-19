
bool phoneRegex(String value) {
  Pattern pattern = r'^\d{5,12}$'; //entre 5 y 12 digitos
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
  {
    print('invalido');
    return false;
  }      
  else{
    return true;
  }      
}