// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Dashboard"),
//         actions: [
//           IconButton(
//             onPressed: () async {
//               // Logout user dari Firebase
//               await FirebaseAuth.instance.signOut();

//               // Arahkan ke login screen
//               Navigator.of(context).pushNamedAndRemoveUntil(
//                 '/login',
//                 (route) => false, // Menghapus semua rute sebelumnya
//               );
//             },
//             icon: const Icon(Icons.logout),
//           ),
//         ],
//       ),
//       body: const Center(
//         child: Text(
//           "Selamat datang di Dashboard!",
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }
// }
