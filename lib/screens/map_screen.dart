import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/restaurant.dart';

class MapScreen extends StatelessWidget {
  final Restaurant restaurant;

  const MapScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lokasi ${restaurant.name}'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(restaurant.latitude, restaurant.longitude),
          initialZoom: 16.0, // Atur tingkat zoom
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(restaurant.latitude, restaurant.longitude),
                child: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
