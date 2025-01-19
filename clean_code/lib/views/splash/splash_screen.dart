import 'package:clean_code/config/routes/routes_name.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash"),
      ),
      body: Center(
        child: TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, RoutesName.homeScreen),
            child: Text("Home")),
      ),
    );
  }
}
