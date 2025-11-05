import 'package:evently_app/features/main_layout/map/widgets/custom_event_card.dart';
import 'package:evently_app/firebase_service/firebase_service.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/providers/map_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapTab extends StatelessWidget {
  const MapTab({super.key});

  @override
  Widget build(BuildContext context) {
    MapTabProvider provider = Provider.of<MapTabProvider>(context);
    late CategoryModel selectedCategory = CategoryModel.categoriesWithAll(
      context,
    )[0];
    return Scaffold(
      body: Stack(
        alignment: AlignmentGeometry.bottomLeft,

        children: [
          Column(
            children: [
              Expanded(
                child: GoogleMap(
                  mapType: MapType.normal,
                  markers: provider.markers,
                  initialCameraPosition: provider.cameraPosition,
                  onMapCreated: (GoogleMapController controller) {
                    provider.mapController = controller;
                  },
                ),
              ),
            ],
          ),
          StreamBuilder(
            stream: FirebaseService.getEventFromFireStoreRealTimeUpdates(
              context,
              selectedCategory,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              List<EventModel> events = snapshot.data ?? [];
              return Container(
                margin: const EdgeInsetsGeometry.only(bottom: 40),
                height: 94.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CustomEventCard(
                    event: events[index],
                  ),
                  itemCount: events.length,
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        onPressed: () {
          provider.getUserLocation();
        },
        child: const Icon(Icons.gps_fixed),
      ),
    );
  }
}
