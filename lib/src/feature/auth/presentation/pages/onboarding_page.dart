import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:kutim/src/core/theme/resources.dart';
import 'package:kutim/src/feature/app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      context.replaceRoute(LauncherRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7024E3),
              Color(0xFF7D7BF6),
            ],
            begin: Alignment.topLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: 514,
                    child: Image.asset(
                      'assets/images/png/launch-page-img.png',
                      fit: BoxFit.cover,
                    )),
                const Text(
                  "Coment",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700, color: AppColors.white, height: 0.8),
                ),
                const Gap(30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Читайте реальные отзывы, чтобы сделать лучший выбор",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Text(
                "Вы делаете мир лучше!",
                style: TextStyle(
                    fontSize: 18, // Reduced font size for better fit
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
