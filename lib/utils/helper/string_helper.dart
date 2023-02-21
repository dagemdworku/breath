class StringHelper {
  static bool isValidEmail(String email) {
    String source =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+";
    return RegExp(source).hasMatch(email);
  }
}
