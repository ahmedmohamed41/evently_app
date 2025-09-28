import 'package:flutter/material.dart';
import 'package:evently_app/models/category_model.dart';

class EventModel {
  CategoryModel category;
  String title;
  String description;
  DateTime dateTime;
  TimeOfDay timeOfDay;
  EventModel({
    required this.category,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.timeOfDay,
  });
}
