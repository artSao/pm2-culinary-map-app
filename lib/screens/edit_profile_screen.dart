import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  bool isLoading = false; // Variabel untuk mengontrol loading

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  // Function to load existing profile data from Firestore
  void _loadProfileData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (userData.exists) {
        setState(() {
          _nameController.text = userData['name'] ?? "";
          _roleController.text = userData['role'] ?? "";
        });
      }
    }
  }

  // Function to save profile data to Firestore
  void _saveProfileToFirestore() async {
    setState(() {
      isLoading = true; // Show loading indicator
    });

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      
      try {
        await users.doc(user.uid).set({
          'name': _nameController.text,
          'role': _roleController.text,
        });

        setState(() {
          isLoading = false; // Hide loading indicator
        });

        // Menampilkan notifikasi "Nama berhasil diperbarui"
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Nama berhasil diperbarui')),
        );

        // Kembali ke halaman sebelumnya dengan data baru
        Navigator.pop(context, {
          'name': _nameController.text,
          'role': _roleController.text,
        });
      } catch (error) {
        setState(() {
          isLoading = false; // Hide loading indicator
        });
        print("Failed to update profile: $error");
        
        // Menampilkan pesan error jika gagal
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal memperbarui profil')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Nama"),
            ),
            TextField(
              controller: _roleController,
              decoration: const InputDecoration(labelText: "Status"),
            ),
            const SizedBox(height: 20),
            isLoading
                ? Center(child: CircularProgressIndicator()) // Tampilkan loading
                : ElevatedButton(
                    onPressed: _saveProfileToFirestore,
                    child: const Text("Save"),
                  ),
          ],
        ),
      ),
    );
  }
}
