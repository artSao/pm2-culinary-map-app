import 'package:culinary_map_app/screens/edit_profile_screen.dart';
import 'package:culinary_map_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/restaurant.dart';
import 'detail_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "User"; // Default name
  String role = "Guest"; // Default role

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Load user data when screen is initialized
  }

  // Function to load user data from Firestore
  void _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (userData.exists) {
        setState(() {
          name = userData['name'] ?? "User";
          role = userData['role'] ?? "Guest";
        });
      }
    }
  }

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors
                        .grey, // Menambahkan warna latar belakang abu-abu untuk ikon
                    child: const Icon(
                      Icons.person, // Ikon pengguna
                      size: 30, // Ukuran ikon
                      color: Colors.white, // Warna ikon
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    name, // Name updated dynamically
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    role, // Role updated dynamically
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("Edit Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(),
                  ),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      name = value['name']; // Update name
                      role = value['role']; // Update role
                    });
                  }
                });
              },
            ),
            Divider(), // Separator before logout
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false,
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Logout gagal: ${e.toString()}')),
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
