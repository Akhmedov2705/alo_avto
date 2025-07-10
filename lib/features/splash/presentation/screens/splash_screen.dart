import 'package:alo_avto/core/service/secure_storage.dart';
import 'package:alo_avto/features/splash/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _storage = SecureStorageService();

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    final accessToken = await _storage.getAccessToken();

    await Future.delayed(const Duration(seconds: 2)); // logoni ko‘rsatish uchun

    if (accessToken != null && accessToken.isNotEmpty) {
      // Token mavjud
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(appBar: AppBar(title: Text("Home"))),
        ),
      );
    } else {
      // Token yo‘q
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: FlutterLogo(size: 100)));
  }
}
