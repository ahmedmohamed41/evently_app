import 'package:evently_app/core/resources/assets_manager.dart';
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

  static List<CategoryModel> categoriesWithAll = [
    CategoryModel(
      id: "0",
      name: "All",
      icon: Icons.all_inclusive_rounded,
      imagePath: "imagePath",
    ),
    CategoryModel(
      id: "1",
      name: "Sports",
      icon: Icons.sports_football_rounded,
      imagePath: ImagesAssets.sports,
    ),
    CategoryModel(
      id: "2",
      name: "Birthday",
      icon: Icons.cake_rounded,
      imagePath: ImagesAssets.birthday,
    ),
    CategoryModel(
      id: "3",
      name: "Meeting",
      icon: Icons.laptop_mac_rounded,
      imagePath: ImagesAssets.meeting,
    ),
    CategoryModel(
      id: "4",
      name: "Gaming",
      icon: Icons.gamepad_rounded,
      imagePath: ImagesAssets.gaming,
    ),
    CategoryModel(
      id: "5",
      name: "Eating",
      icon: Icons.local_pizza_rounded,
      imagePath: ImagesAssets.eating,
    ),
    CategoryModel(
      id: "6",
      name: "Holiday",
      icon: Icons.holiday_village_rounded,
      imagePath: ImagesAssets.holiday,
    ),
    CategoryModel(
      id: "7",
      name: "Exhibition",
      icon: Icons.water_drop_rounded,
      imagePath: ImagesAssets.exhibition,
    ),
    CategoryModel(
      id: "8",
      name: "Workshop",
      icon: Icons.workspaces_rounded,
      imagePath: ImagesAssets.workShop,
    ),
    CategoryModel(
      id: "9",
      name: "book Club",
      icon: Icons.book_online_rounded,
      imagePath: ImagesAssets.bookClub,
    ),
  ];
  static List<CategoryModel> categories = [
    CategoryModel(
      id: "1",
      name: "Sports",
      icon: Icons.sports_football_rounded,
      imagePath: ImagesAssets.sports,
    ),
    CategoryModel(
      id: "2",
      name: "Birthday",
      icon: Icons.cake_rounded,
      imagePath: ImagesAssets.birthday,
    ),
    CategoryModel(
      id: "3",
      name: "Meeting",
      icon: Icons.laptop_mac_rounded,
      imagePath: ImagesAssets.meeting,
    ),
    CategoryModel(
      id: "4",
      name: "Gaming",
      icon: Icons.gamepad_rounded,
      imagePath: ImagesAssets.gaming,
    ),
    CategoryModel(
      id: "5",
      name: "Eating",
      icon: Icons.local_pizza_rounded,
      imagePath: ImagesAssets.eating,
    ),
    CategoryModel(
      id: "6",
      name: "Holiday",
      icon: Icons.holiday_village_rounded,
      imagePath: ImagesAssets.holiday,
    ),
    CategoryModel(
      id: "7",
      name: "Exhibition",
      icon: Icons.water_drop_rounded,
      imagePath: ImagesAssets.exhibition,
    ),
    CategoryModel(
      id: "8",
      name: "Workshop",
      icon: Icons.workspaces_rounded,
      imagePath: ImagesAssets.workShop,
    ),
    CategoryModel(
      id: "9",
      name: "book Club",
      icon: Icons.book_online_rounded,
      imagePath: ImagesAssets.bookClub,
    ),
  ];
}
