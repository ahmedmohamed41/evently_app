import 'package:evently_app/core/extensions/date_ex.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/routes/app_routes.dart';
import 'package:evently_app/features/event_details/event_details.dart';
import 'package:evently_app/firebase_service/firebase_service.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/providers/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventItem extends StatefulWidget {
  const EventItem({super.key, required this.event, this.markAsFavourite});
  final EventModel event;
  final bool? markAsFavourite;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  late bool favorite = widget.markAsFavourite ?? false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetails(
              event: widget.event,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 203.h,
            width: double.infinity,
            padding: REdgeInsets.all(8),
            margin: REdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(widget.event.category.imagePath),
              ),
              borderRadius: BorderRadius.circular(16.r),
              border: BoxBorder.all(width: 1.w, color: ColorsManager.blue),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: REdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          widget.event.dateTime.formattedNumDay,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          widget.event.dateTime.formattedNameMonth,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: REdgeInsets.all(8),
                          child: Text(
                            widget.event.title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: _markEventAsFavourite,
                        icon: Icon(
                          favorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: ColorsManager.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _markEventAsFavourite() async {
    if (favorite) {
      await FirebaseService.removeEventToFavourite(widget.event);
      favorite = false;
    } else {
      await FirebaseService.addEventToFavourite(widget.event);
      favorite = true;
    }
    setState(() {
      FavouriteProvider.instance.refresh();
    });
  }
}
