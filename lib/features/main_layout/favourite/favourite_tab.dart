import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/features/main_layout/home/event_item.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: ColorsManager.blue),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: ColorsManager.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: ColorsManager.blue),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: ColorsManager.blue,
                ),
                hintText: AppLocalizations.of(context)!.search_for_event,
                hintStyle: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.blue,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 16.h,
              ),
              itemBuilder: (context, index) => EventItem(
                event: EventModel(
                  eventId: '',
                  userId: '',
                  category: CategoryModel.categories(context)[4],
                  dateTime: DateTime.now(),

                  title: 'Meeting for Updating The Development Method ',
                  description: 'Meeting for Updating The Development Method ',
                ),
              ),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
