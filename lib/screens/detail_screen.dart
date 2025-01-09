import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import 'map_screen.dart'; // Import file MapScreen

class DetailScreen extends StatefulWidget {
  final Restaurant restaurant;

  const DetailScreen({super.key, required this.restaurant});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.restaurant.description,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Kategori: ${widget.restaurant.category}"),
            Text("Alamat: ${widget.restaurant.address}"),
            Text("Jam Operasional: ${widget.restaurant.operatingHours}"),
            const SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) =>
            //             MapScreen(restaurant: widget.restaurant),
            //       ),
            //     );
            //   },
            //   child: const Text("Lihat Lokasi di Peta"),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MapScreen(restaurant: widget.restaurant),
                  ),
                );
              },
              child: const Text("Lihat Lokasi di Peta"),
            ),
            const SizedBox(height: 16),
            const Text(
              "Menu:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.restaurant.menu.length,
                itemBuilder: (context, index) {
                  final foodItem = widget.restaurant.menu[index];
                  return Card(
                    child: ListTile(
                      title: Text(foodItem.name),
                      subtitle: Text(foodItem.description),
                      trailing: Text(
                        "Rp ${foodItem.price.toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
