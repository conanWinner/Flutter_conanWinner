void main() {
  bool validateEmail(String email) {
    if (!email.contains("@")) return false;
    var tmp = email.split("@");
    if (tmp[0].length < 2) return false;
    return true;
  }

  print(validateEmail("a@"));

  bool validatePassword(String password) {
    int up = 0;
    int low = 0;
    int num = 0;
    if (password.length < 6) return false;
    var value = password.codeUnits;
    for (int i = 0; i < value.length; i++) {
      if (value[i] >= 'A'.codeUnits.first && value[i] <= 'Z'.codeUnitAt(0))
        up++;
      if (value[i] >= 'a'.codeUnits.first && value[i] <= 'z'.codeUnits.first)
        low++;
      if (value[i] >= '0'.codeUnits.first && value[i] <= '9'.codeUnits.first)
        num++;
    }

    print(up);
    print(low);
    print(num);

    if (up == 0 || low == 0 || num == 0) return false;

    return true;
  }

  validatePassword("password123A ");
}
