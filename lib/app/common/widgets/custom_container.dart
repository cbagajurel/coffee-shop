import 'package:coffee_shop/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  const CustomContainer({
    super.key,
    this.color,
    this.borderRadius,
    this.borderColor,
    required this.child,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height?.h,
        width: width?.w ?? double.maxFinite,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? AppColors.card,
          borderRadius: borderRadius ?? BorderRadius.circular(8.r),
          border: Border.all(
            color: borderColor ?? AppColors.border,
            width: 0.4.w,
          ),
        ),
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        margin: margin ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
