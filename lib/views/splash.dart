import 'package:filme_app/components/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'app_widget.dart';

//Tela de inicialização do App

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // ignore: must_call_super
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Get.to(() => const AppWidget());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customTheme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash.png'),
            const Text(
              'Carregando...',
              style: TextStyle(
                  color: Color(0xFF139893), fontFamily: 'Roboto', fontSize: 22),
            ),
            const SizedBox(height: 8),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                Color(0xFF139893),
              ),
              strokeWidth: 10,
            ),
          ],
        ),
      ),
    );
  }
}
