import 'package:culinary_map_app/screens/edit_profile_screen.dart';
import 'package:culinary_map_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/restaurant.dart';
import 'detail_screen.dart';
import 'package:intl/intl.dart'; // Untuk format waktu

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "User";
  String role = "Guest";
  int selectedIndex = 0; // Untuk menyimpan tab yang aktif

  @override
  void initState() {
    super.initState();
    _checkUserLoginStatus(); // Periksa status login
  }

  void _checkUserLoginStatus() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Jika pengguna tidak ada, arahkan ke halaman login
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false, // Hapus semua route sebelumnya
      );
    } else {
      // Jika ada pengguna, lanjutkan untuk memuat data pengguna
      _loadUserData();
    }
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

  // Cek apakah restoran buka berdasarkan jam operasi
  bool _isRestaurantOpen(String operatingHours) {
    final now = DateTime.now(); // Ambil waktu saat ini
    final format = DateFormat('HH:mm'); // Format untuk parsing waktu

    try {
      // Pastikan format jam operasional valid
      if (!operatingHours.contains(' - ')) return false;

      final times = operatingHours.split(' - ');
      final openTime = format.parse(times[0]);
      final closeTime = format.parse(times[1]);

      // Konversi waktu buka dan tutup ke `DateTime`
      final openDateTime = DateTime(now.year, now.month, now.day, openTime.hour, openTime.minute);
      final closeDateTime = closeTime.hour >= openTime.hour
          ? DateTime(now.year, now.month, now.day, closeTime.hour, closeTime.minute)
          : DateTime(now.year, now.month, now.day + 1, closeTime.hour, closeTime.minute);

      // Periksa apakah waktu saat ini berada dalam rentang buka
      return now.isAfter(openDateTime) && now.isBefore(closeDateTime);
    } catch (e) {
      return false; // Jika parsing gagal, anggap tutup
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filter restoran berdasarkan status buka/tutup
    final openRestaurants = dummyRestaurants
        .where((restaurant) => _isRestaurantOpen(restaurant.operatingHours))
        .toList();
    final closedRestaurants = dummyRestaurants
        .where((restaurant) => !_isRestaurantOpen(restaurant.operatingHours))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
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
                    backgroundColor: Colors.grey,
                    child: const Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    role,
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
                      name = value['name'];
                      role = value['role'];
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Konfirmasi Logout"),
                      content: const Text("Apakah Anda yakin ingin logout?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Tutup dialog
                          },
                          child: const Text("Tidak"),
                        ),
                        TextButton(
                          onPressed: () async {
                            try {
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                                (route) => false,
                              );
                            } catch (e) {
                              Navigator.of(context)
                                  .pop(); // Tutup dialog jika gagal logout
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text('Logout gagal: ${e.toString()}')),
                              );
                            }
                          },
                          child: const Text("Ya"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: [
                // Tab untuk restoran buka
                ListView.builder(
                  itemCount: openRestaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = openRestaurants[index];
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
                // Tab untuk restoran tutup
                ListView.builder(
                  itemCount: closedRestaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = closedRestaurants[index];
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
              ],
            ),
          ),
          // Navbar di bawah
          BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.restaurant, color: Colors.green),
                label: 'Buka',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.restaurant, color: Colors.red),
                label: 'Tutup',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
