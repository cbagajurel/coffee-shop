import 'package:coffee_shop/utils/app_colors.dart';
import 'package:coffee_shop/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../dashboard/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Image.asset(
            AppConstants.BACKGROUND_IMAGE,
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: double.maxFinite,
            opacity: const AlwaysStoppedAnimation(0.04),
          ),
          Center(child: Image.asset(AppConstants.APP_LOGO, height: 100.sp)),
        ],
      ),
    );
  }
}
