bool isEmailValid(String email) {
  RegExp regex = RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

  return regex.hasMatch(email);
}

bool containsNumbers(String s) {
  RegExp regex = RegExp(r'\d');

  return regex.hasMatch(s);
}

bool isNumeric(String s) {
  RegExp regex = RegExp(r'^[0-9]+$');

  return regex.hasMatch(s);
}
