import 'package:culinary_map_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Restaurant> dummyRestaurants = [
    Restaurant(
      name: "Restoran A",
      description: "Masakan Italia terbaik di kota.",
      category: "Italia",
      address: "Jl. Sudirman No. 1",
      operatingHours: "08:00 - 20:00",
      latitude: -6.200000,
      longitude: 106.816666,
      menu: [
        FoodItem(
          name: "Spaghetti Carbonara",
          description: "Spaghetti dengan saus keju dan bacon.",
          price: 75000,
        ),
        FoodItem(
          name: "Pizza Margherita",
          description: "Pizza dengan saus tomat dan keju mozzarella.",
          price: 95000,
        ),
      ],
    ),
    Restaurant(
      name: "Restoran B",
      description: "Spesialis masakan Jepang.",
      category: "Jepang",
      address: "Jl. Gatot Subroto No. 5",
      operatingHours: "10:00 - 22:00",
      latitude: -6.210000,
      longitude: 106.826666,
      menu: [
        FoodItem(
          name: "Sushi Salmon",
          description: "Sushi isi salmon segar.",
          price: 85000,
        ),
        FoodItem(
          name: "Ramen Miso",
          description: "Mie ramen dengan kuah miso khas Jepang.",
          price: 65000,
        ),
      ],
    ),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peta Kuliner"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: const Center(
                child: Text(
                  "Culinary Map",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.logout),
            //   title: const Text("Logout"),
            //   onTap: () {
            //     Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.logout),
            //   title: const Text("Logout"),
            //   onTap: () async {
            //     await FirebaseAuth.instance.signOut();
            //     Navigator.pushAndRemoveUntil(
            //       context,
            //       MaterialPageRoute(builder: (context) => const LoginScreen()),
            //       (route) => false, // Menghapus semua layar sebelumnya
            //     );
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () async {
                try {
                  await FirebaseAuth.instance
                      .signOut(); // Keluar dari akun Firebase
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false, // Hapus semua layar sebelumnya
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Logout failed: ${e.toString()}')),
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: dummyRestaurants.length,
        itemBuilder: (context, index) {
          final restaurant = dummyRestaurants[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(restaurant.name[0]),
            ),
            title: Text(restaurant.name),
            subtitle: Text(restaurant.category),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(restaurant: restaurant),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
