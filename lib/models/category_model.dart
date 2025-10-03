import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  IconData icon;
  String imagePath;
  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.imagePath,
  });

  static List<CategoryModel> categoriesWithAll(BuildContext context) {
    AppLocalizations appLocalizations=AppLocalizations.of(context)!;
    return [
      CategoryModel(
        id: "0",
        name: appLocalizations.all,
        icon: Icons.all_inclusive_rounded,
        imagePath: "imagePath",
      ),
      CategoryModel(
        id: "1",
        name: appLocalizations.sports,
        icon: Icons.sports_football_rounded,
        imagePath: ImagesAssets.sports,
      ),
      CategoryModel(
        id: "2",
        name: appLocalizations.birthday,
        icon: Icons.cake_rounded,
        imagePath: ImagesAssets.birthday,
      ),
      CategoryModel(
        id: "3",
        name: appLocalizations.meeting,
        icon: Icons.laptop_mac_rounded,
        imagePath: ImagesAssets.meeting,
      ),
      CategoryModel(
        id: "4",
        name: appLocalizations.gaming,
        icon: Icons.gamepad_rounded,
        imagePath: ImagesAssets.gaming,
      ),
      CategoryModel(
        id: "5",
        name: appLocalizations.eating,
        icon: Icons.local_pizza_rounded,
        imagePath: ImagesAssets.eating,
      ),
      CategoryModel(
        id: "6",
        name: appLocalizations.holiday,
        icon: Icons.holiday_village_rounded,
        imagePath: ImagesAssets.holiday,
      ),
      CategoryModel(
        id: "7",
        name: appLocalizations.exhibition,
        icon: Icons.water_drop_rounded,
        imagePath: ImagesAssets.exhibition,
      ),
      CategoryModel(
        id: "8",
        name: appLocalizations.workshop,
        icon: Icons.workspaces_rounded,
        imagePath: ImagesAssets.workShop,
      ),
      CategoryModel(
        id: "9",
        name: appLocalizations.book_club,
        icon: Icons.book_online_rounded,
        imagePath: ImagesAssets.bookClub,
      ),
    ];
  }


  static List<CategoryModel> categories(BuildContext context) {
    AppLocalizations appLocalizations=AppLocalizations.of(context)!;
    return [
     
      CategoryModel(
        id: "1",
        name: appLocalizations.sports,
        icon: Icons.sports_football_rounded,
        imagePath: ImagesAssets.sports,
      ),
      CategoryModel(
        id: "2",
        name: appLocalizations.birthday,
        icon: Icons.cake_rounded,
        imagePath: ImagesAssets.birthday,
      ),
      CategoryModel(
        id: "3",
        name: appLocalizations.meeting,
        icon: Icons.laptop_mac_rounded,
        imagePath: ImagesAssets.meeting,
      ),
      CategoryModel(
        id: "4",
        name: appLocalizations.gaming,
        icon: Icons.gamepad_rounded,
        imagePath: ImagesAssets.gaming,
      ),
      CategoryModel(
        id: "5",
        name: appLocalizations.eating,
        icon: Icons.local_pizza_rounded,
        imagePath: ImagesAssets.eating,
      ),
      CategoryModel(
        id: "6",
        name: appLocalizations.holiday,
        icon: Icons.holiday_village_rounded,
        imagePath: ImagesAssets.holiday,
      ),
      CategoryModel(
        id: "7",
        name: appLocalizations.exhibition,
        icon: Icons.water_drop_rounded,
        imagePath: ImagesAssets.exhibition,
      ),
      CategoryModel(
        id: "8",
        name: appLocalizations.workshop,
        icon: Icons.workspaces_rounded,
        imagePath: ImagesAssets.workShop,
      ),
      CategoryModel(
        id: "9",
        name: appLocalizations.book_club,
        icon: Icons.book_online_rounded,
        imagePath: ImagesAssets.bookClub,
      ),
    ];
  }


}
