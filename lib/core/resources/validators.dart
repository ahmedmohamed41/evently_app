
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

abstract class Validator {
  static String? validateName(String? input ,BuildContext context) {
    if (input == null || input.trim().isEmpty) {
      return AppLocalizations.of(context)!.name_is_required;
    }
    if (input.length < 4) {
      return AppLocalizations.of(context)!.name_should_be_at_leaste_4_chars;
    }
    return null;
  }

  static bool validEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  static String? validateEmail(String? input ,BuildContext context) {
    if (input == null || input.trim().isEmpty) {
      return AppLocalizations.of(context)!.email_is_required;
    }
    if (!validEmail(input)) {
     return AppLocalizations.of(context)!.email_bad_format;
    }
    return null;
  }

  static bool validPassword(String password) {
    return RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    ).hasMatch(password);
  }

  static String? validatePassword(String? input,BuildContext context) {
    if (input == null || input.trim().isEmpty) {
      return AppLocalizations.of(context)!.password_is_required;
    }
    if (!validPassword(input)) {
     return AppLocalizations.of(context)!.weak_password;
    }
    return null;
  }
}
