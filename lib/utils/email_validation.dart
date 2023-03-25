bool emailValidation(String email) {
  return RegExp(r"^[A-Za-z0-9]+@gmail.com").hasMatch(email);
}
