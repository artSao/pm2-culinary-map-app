import 'package:culinary_map_app/screens/signup-screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Login Gagal"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  Future<void> _saveLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  bool _validateInputs() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty) {
      _showErrorDialog("Email tidak boleh kosong.");
      return false;
    }
    if (password.isEmpty) {
      _showErrorDialog("Password tidak boleh kosong.");
      return false;
    }
    if (!RegExp(r"^[^@]+@[^@]+\.[^@]+").hasMatch(email)) {
      _showErrorDialog("Format email tidak valid.");
      return false;
    }

    return true;
  }

 Future<void> _login() async {
  if (!_validateInputs()) return; // Validasi input

  setState(() {
    _isLoading = true;
  });

  try {
    // Firebase login
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    // Simpan status login
    await _saveLoginStatus(true);

    // Navigasi ke home
    Navigator.pushReplacementNamed(context, '/home');
  } on FirebaseAuthException catch (e) {
    // Log error di konsol
    print('Firebase Auth Error: ${e.code} - ${e.message}');

    // Handle berbagai kode error Firebase
    String errorMessage;
    if (e.code == 'wrong-password') {
      errorMessage = 'Password salah. Coba lagi.';
    } else if (e.code == 'user-not-found') {
      errorMessage = 'Email tidak ditemukan. Silakan periksa kembali.';
    } else if (e.code == 'invalid-email') {
      errorMessage = 'Format email tidak valid.';
    } else {
      errorMessage = 'Terjadi kesalahan: ${e.message ?? "tidak diketahui"}';
    }

    _showErrorDialog(errorMessage); // Tampilkan dialog error
  } catch (e) {
    print('Error umum: $e'); // Untuk semua error lain
    _showErrorDialog('Terjadi kesalahan tidak terduga. Coba lagi.');
  } finally {
    setState(() {
      _isLoading = false;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Culinary ",
                style: GoogleFonts.pacifico(
                  textStyle: const TextStyle(
                    color: Colors.orange,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const TextSpan(
                text: "Map ",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Login ke akun Anda",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      child: const Text('Login'),
                    ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: const Text("Belum punya akun? Daftar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
