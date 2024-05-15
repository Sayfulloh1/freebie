import 'dart:async';

import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnBoardingPage(),
            )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width(context),
            height: height(context),
            decoration: BoxDecoration(
              gradient: backGroundGradient,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: width(context) * .05,
              height: width(context) * .05,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.white12),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: width(context) * .3,
              height: width(context) * .3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.white12),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: width(context) * .7,
              height: width(context) * .7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.white12),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: width(context) * 1.1,
              height: width(context) * 1.1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.white12),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: width(context) * .5,
              height: height(context) * .1,
              child: Image.asset(
                'assets/images/Logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
