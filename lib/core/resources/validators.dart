abstract class Validator {
  static String? validateName(String? input) {
    if (input == null || input.trim().isEmpty) {
      return "Name is required";
    }
    if (input.length < 4) {
      return "Name should be at leaste 4 chars ";
    }
    return null;
  }

  static bool validEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  static String? validateEmail(String? input) {
    if (input == null || input.trim().isEmpty) {
      return "Email is required";
    }
    if (!validEmail(input)) {
      return "Email Bad Format ";
    }
    return null;
  }

  static bool validPassword(String password) {
    return RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    ).hasMatch(password);
  }

  static String? validatePassword(String? input) {
    if (input == null || input.trim().isEmpty) {
      return "Password is required";
    }
    if (!validPassword(input)) {
      return "weak password";
    }
    return null;
  }
}
