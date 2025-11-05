import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/features/main_layout/home/event_item.dart';
import 'package:evently_app/firebase_service/firebase_service.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavouriteTab extends StatefulWidget {
  const FavouriteTab({super.key});

  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider.value(
        value: FavouriteProvider.instance,
        child: Consumer<FavouriteProvider>(
          builder: (context, notifier, _) => Column(
            children: [
              _buildSearchField(context),
              FutureBuilder(
                future: FirebaseService.getFavouriteEvent(
                  context,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  final favEvents = snapshot.data ?? [];
                  if (favEvents.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.no_favourite_events_yet,
                        ),
                      ),
                    );
                  }
                  final filtered = favEvents
                      .where(
                        (event) =>
                            searchQuery.isEmpty ||
                            event.title.toLowerCase().contains(searchQuery),
                      )
                      .toList();
                  return Expanded(
                    child: ListView.separated(
                      padding: REdgeInsets.only(top: 20),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 16.h,
                      ),
                      itemBuilder: (context, index) => EventItem(
                        event: filtered[index],
                        markAsFavourite: true,
                      ),
                      itemCount: filtered.length,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),

      child: TextField(
        onChanged: (value) {
          setState(() => searchQuery = value.trim().toLowerCase());
        },
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
    );
  }
}
