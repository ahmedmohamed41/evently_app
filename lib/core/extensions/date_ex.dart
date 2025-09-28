import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get formattedNameMonth {
    return DateFormat('MMM').format(this);
  }

  String get formattedNumDay {
    return DateFormat('dd').format(this);
  }
}
