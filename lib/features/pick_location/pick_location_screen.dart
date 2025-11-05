import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/features/pick_location/provider/pick_location_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class PickLocationScreen extends StatelessWidget {
  const PickLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PickLocationProvider provider = Provider.of<PickLocationProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              markers: provider.markers,
              initialCameraPosition: provider.cameraPosition,
              onMapCreated: (GoogleMapController controller) {
                provider.mapController = controller;
              },
              onTap: (location) async {
                provider.pickLocation(location);
                await provider.convertLatlngForEvent();
                Navigator.pop(context);
              },
            ),
          ),

          Container(
            height: 70,
            width: double.infinity,
            color: ColorsManager.blue,
            child: Center(
              child: Text(
                'Tap on Location To Select',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ColorsManager.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
