// import 'package:culinary_map_app/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';
import 'login_screen.dart';


class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          // Jika pengguna login, arahkan ke HomeScreen
          return HomeScreen();
        } else {
          // Jika tidak login, arahkan ke LoginScreen
          return const LoginScreen();
        }
      },
    );
  }
}

   

// class AuthWrapper extends StatelessWidget {
//   const AuthWrapper({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasData) {
//           return HomeScreen(); // Langsung ke `HomeScreen`
//         } else {
//           return const LoginScreen(); // Tetap ke halaman login jika tidak ada pengguna
//         }
//       },
//     );
//   }
// }

