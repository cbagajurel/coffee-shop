import 'package:coffee_shop/app/common/widgets/custom_form_field.dart';
import 'package:coffee_shop/app/view/screens/home/_widgets/product_card.dart';
import 'package:coffee_shop/utils/app_colors.dart';
import 'package:coffee_shop/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
          SliverAppBar(
            pinned: true,
            floating: true,
            toolbarHeight: 80.h,
            surfaceTintColor: AppColors.background,

            backgroundColor: AppColors.card,
            elevation: 0,
            leading: SizedBox.shrink(),
            flexibleSpace: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "C-Shop",
                              style: AppTextStyle
                                  .text28Bold
                                  .primary
                                  .spaceGrotesk
                                  .style,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                        ),
                      ],
                    ),

                    4.verticalSpace,
                    CustomFormField(
                      hintText: "Search",
                      fieldType: CustomFieldType.text,
                      suffix: Container(
                        margin: EdgeInsets.only(right: 4.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Icon(Icons.search, color: AppColors.card),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Coffee's Varieties",
                    style: AppTextStyle.text24Bold.primary.spaceGrotesk.style,
                  ),
                  Text(
                    "Explore the best coffee for you",
                    style:
                        AppTextStyle.text12Medium.textSecondary.poppins.style,
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            sliver: SliverMasonryGrid.count(
              crossAxisCount: 2,
              childCount: 20,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              itemBuilder: (context, index) => ProductCard(),
            ),
          ),
        ],
      ),
    );
  }
}
