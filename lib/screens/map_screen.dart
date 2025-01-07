import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/restaurant.dart';

class MapScreen extends StatelessWidget {
  final Restaurant restaurant;

  const MapScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Periksa apakah latitude dan longitude valid
    if (restaurant.latitude == 0 || restaurant.longitude == 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Lokasi ${restaurant.name}"),
        ),
        body: Center(
          child: Text(
            "Lokasi tidak tersedia",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Lokasi ${restaurant.name}"),
      // ),
      // body: GoogleMap(
      //   initialCameraPosition: CameraPosition(
      //     target: LatLng(restaurant.latitude, restaurant.longitude),
      //     zoom: 15,
      //   ),
      //   markers: {
      //     Marker(
      //       markerId: MarkerId(
      //         '${restaurant.name}-${restaurant.latitude}-${restaurant.longitude}',
      //       ),
      //       position: LatLng(restaurant.latitude, restaurant.longitude),
      //       infoWindow: InfoWindow(
      //         title: restaurant.name,
      //         snippet: restaurant.address,
      //       ),
      //     ),
      //   },
      // ),
    );
  }
}
