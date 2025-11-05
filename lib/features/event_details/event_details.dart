import 'package:evently_app/core/UI_Utils/ui_utils.dart';
import 'package:evently_app/core/extensions/date_ex.dart';
import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/routes/app_routes.dart';
import 'package:evently_app/core/widgets/custom_navigator_location.dart';
import 'package:evently_app/features/edit_event/edit_event.dart';
import 'package:evently_app/firebase_service/firebase_service.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          appLocalizations.event_details,
          style: const TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  EditEvent(
                    event: event,
                  ),
                ),
                
              );
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () => _deleteEvent(context),
            icon: const Icon(
              Icons.delete,
              color: ColorsManager.redWhite,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 203.h,
                width: 361.w,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(16),
                  child: Image.asset(event.category.imagePath),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomNavigatorLocation(
                icon: Icons.calendar_month,
                title: event.dateTime.formatttedDate,
                desc: event.dateTime.formatttedTime,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomNavigatorLocation(
                icon: Icons.gps_fixed,
                title: '${event.city},${event.country}',
                iconArrow: Icons.arrow_forward_ios,
              ),
              SizedBox(
                height: 361.h,
                width: 361.w,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(16),
                  child: Image.asset(ImagesAssets.location),
                ),
              ),
              Text(
                'Description\n\n${event.description}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _deleteEvent(BuildContext context) async {
    UiUtils.showLoading(context);
    await FirebaseService.deleteEventToFireStore(event, context);
    UiUtils.hideLoading(context);
    UiUtils.showFluttertoast('Delete Event Successfully', Colors.green);
    Navigator.pushReplacementNamed(context, AppRoutes.mainLayout);
  }
}
