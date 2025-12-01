import 'package:coffee_shop/app/common/widgets/custom_container.dart';
import 'package:coffee_shop/utils/app_colors.dart';
import 'package:coffee_shop/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  const CustomButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      borderRadius: BorderRadius.circular(6.r),
      color: AppColors.primary,

      onTap: onTap,
      child: Text(
        text ?? "",
        style: AppTextStyle.text14Medium.textOnDark.poppins.style,
      ),
    );
  }
}
