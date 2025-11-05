import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PickLocationProvider extends ChangeNotifier {
  PickLocationProvider() {
    getUserLocation();
  }
  final Location location = Location();
  String locationMessage = '';
  GoogleMapController? mapController;
  Set<Marker> markers = {};

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

  LatLng? eventLocation;
  String? city;
  String? country;


  void pickLocation(LatLng location) {
    eventLocation = location;
    markers.add(
      Marker(
        markerId: MarkerId(UniqueKey().toString()),
        position: location,
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
    notifyListeners();
  }

  Future<void> convertLatlngForEvent() async {
    if (eventLocation == null) return;
    List<geocoding.Placemark> placeMark = await geocoding
        .placemarkFromCoordinates(
          eventLocation?.latitude ?? 0,
          eventLocation?.longitude ?? 0,
        );
    if (placeMark.isNotEmpty) {
      city = placeMark.first.locality ?? 'unKnown';
      country = placeMark.first.country ?? 'unKnown';
    }
    notifyListeners();
  }

  void _changeCameraPositionOnMap(LocationData locationData) {
    cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0),
      zoom: 17,
    );
    markers.add(
      Marker(
        markerId: MarkerId(UniqueKey().toString()),
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
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
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
    mapController?.dispose();
    log('Provider disposed');
    super.dispose();
  }
}
