import 'package:flutter/foundation.dart';

class FavouriteProvider extends ChangeNotifier {
  static final FavouriteProvider instance = FavouriteProvider._internal();
  FavouriteProvider._internal();

  void refresh() {
    notifyListeners();
  }
}
