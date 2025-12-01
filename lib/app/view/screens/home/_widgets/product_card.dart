import 'package:coffee_shop/app/common/widgets/custom_button.dart';
import 'package:coffee_shop/app/common/widgets/custom_container.dart';
import 'package:coffee_shop/utils/app_colors.dart';
import 'package:coffee_shop/utils/app_constants.dart';
import 'package:coffee_shop/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderColor: AppColors.transparent,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              child: Image(
                height: double.maxFinite,
                width: double.maxFinite,
                image: AssetImage(AppConstants.COFFEE_IMAGE),
                fit: BoxFit.cover,
              ),
            ),
          ),
          CustomContainer(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Espresso",
                        style: AppTextStyle.text18Bold.text.poppins.style,
                      ),
                      Text(
                        "Best coffee for you",
                        style: AppTextStyle
                            .text12Regular
                            .textSecondary
                            .poppins
                            .style,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                10.horizontalSpace,
                Expanded(flex: 1, child: CustomButton(text: "Buy")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
