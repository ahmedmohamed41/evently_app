import 'dart:async';
import 'dart:developer';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapTabProvider extends ChangeNotifier {
  MapTabProvider() {
    log('Get Location in constructor');
    getUserLocation();
  }

  final Location location = Location();
  String locationMessage = '';
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  // late final StreamSubscription<LocationData> _locationStream;

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 17,
  );

  Future<bool> _getLocationPermission() async {
    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> _checkLocationService() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    return serviceEnabled;
  }

  void _changeCameraPositionOnMap(LocationData locationData) {
    cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0),
      zoom: 17,
    );
    markers.add(
      Marker(
        markerId: const MarkerId('1'),
        position: LatLng(
          locationData.latitude ?? 0,
          locationData.longitude ?? 0,
        ),
        infoWindow: const InfoWindow(
          title: 'My Location',
          snippet: 'A cool place',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ), // Customizing marker color
        onTap: () {
          log('Marker tapped!');
        },
      ),
    );
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void navigateToEventLocationOnMap(LatLng location, EventModel event) {
    cameraPosition = CameraPosition(
      target: location,
      zoom: 17,
    );
    markers.add(
      Marker(
        markerId: MarkerId(UniqueKey().toString()),
        position: location,
        infoWindow: InfoWindow(
          title: event.city,
          snippet: event.description,
        ),
      ),
    );
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    notifyListeners();
  }

  Future<void> getUserLocation() async {
    bool isPremissionGranted = await _getLocationPermission();
    if (!isPremissionGranted) return;

    bool isGpsServiceEnabled = await _checkLocationService();

    if (!isGpsServiceEnabled) return;

    LocationData locationData = await location.getLocation();
    _changeCameraPositionOnMap(locationData);
    notifyListeners();
  }

  @override
  void dispose() {
    mapController.dispose();
    log('Provider disposed');
    super.dispose();
  }
}
