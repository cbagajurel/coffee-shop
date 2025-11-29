import 'package:coffee_shop/utils/app_colors.dart';
import 'package:coffee_shop/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        controller: _scrollController,

        slivers: [
          SliverAppBar(backgroundColor: AppColors.text),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Explore Coffee",
                  style: AppTextStyle().text28.bold.primary.spaceGrotesk.style,
                ),
                Text(
                  "Find the best coffee for you",
                  style:
                      AppTextStyle().text14.regular.textSecondary.poppins.style,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
