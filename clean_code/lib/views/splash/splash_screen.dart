import 'package:clean_code/config/components/internet_exception_widget.dart';
import 'package:clean_code/data/exceptions/app_exceptions.dart';

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
      floatingActionButton: FloatingActionButton(onPressed: () {
        NoInternetException('');
      }),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              InternetException(
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
