import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:flutter/material.dart';

class EventModel {
  String eventId;
  String userId;
  CategoryModel category;
  String title;
  String description;
  DateTime dateTime;

  EventModel({
    required this.userId,
    required this.eventId,
    required this.category,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  EventModel.fromJson(Map<String, dynamic> json, BuildContext context)
    : this(
        userId: json['userId'],
        eventId: json['eventId'],
        category: CategoryModel.categories(context).firstWhere(
          (category) => json['categoryId'] == category.id,
        ),
        title: json['title'],
        description: json['description'],
        dateTime: (json['dateTime'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'eventId': eventId,
    'categoryId': category.id,
    'title': title,
    'description': description,
    'dateTime': dateTime,
  };
}
