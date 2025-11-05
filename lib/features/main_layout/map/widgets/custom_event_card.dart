import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/providers/map_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class CustomEventCard extends StatelessWidget {
  const CustomEventCard({
    super.key,
    required this.event,
  });

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<MapTabProvider>().navigateToEventLocationOnMap(
          LatLng(event.latitude ?? 0, event.longitude ?? 0),
          event,
        );
      },
      child: Container(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 12),
        margin: REdgeInsets.only(left: 20, bottom: 10),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorsManager.blue, width: 1),
        ),
        height: 94.h,
        width: 321.w,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                event.category.imagePath,
                height: 78.h,
                width: 110.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${event.title}\n${event.description}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorsManager.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          '${event.city}, ${event.country}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
