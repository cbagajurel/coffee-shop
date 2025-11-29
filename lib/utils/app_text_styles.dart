import 'package:coffee_shop/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  final TextStyle _style;

  AppTextStyle._(this._style);

  factory AppTextStyle() => AppTextStyle._(GoogleFonts.inter());

  // Font size methods
  AppTextStyle get text10 => AppTextStyle._(_style.copyWith(fontSize: 10));
  AppTextStyle get text11 => AppTextStyle._(_style.copyWith(fontSize: 11));
  AppTextStyle get text12 => AppTextStyle._(_style.copyWith(fontSize: 12));
  AppTextStyle get text14 => AppTextStyle._(_style.copyWith(fontSize: 14));
  AppTextStyle get text16 => AppTextStyle._(_style.copyWith(fontSize: 16));
  AppTextStyle get text18 => AppTextStyle._(_style.copyWith(fontSize: 18));
  AppTextStyle get text20 => AppTextStyle._(_style.copyWith(fontSize: 20));
  AppTextStyle get text22 => AppTextStyle._(_style.copyWith(fontSize: 22));
  AppTextStyle get text24 => AppTextStyle._(_style.copyWith(fontSize: 24));
  AppTextStyle get text28 => AppTextStyle._(_style.copyWith(fontSize: 28));
  AppTextStyle get text30 => AppTextStyle._(_style.copyWith(fontSize: 30));
  AppTextStyle get text32 => AppTextStyle._(_style.copyWith(fontSize: 32));
  AppTextStyle get text36 => AppTextStyle._(_style.copyWith(fontSize: 36));
  AppTextStyle get text40 => AppTextStyle._(_style.copyWith(fontSize: 40));

  // Font weight methods
  AppTextStyle get light =>
      AppTextStyle._(_style.copyWith(fontWeight: FontWeight.w300));
  AppTextStyle get regular =>
      AppTextStyle._(_style.copyWith(fontWeight: FontWeight.w400));
  AppTextStyle get medium =>
      AppTextStyle._(_style.copyWith(fontWeight: FontWeight.w500));
  AppTextStyle get semiBold =>
      AppTextStyle._(_style.copyWith(fontWeight: FontWeight.w600));
  AppTextStyle get bold =>
      AppTextStyle._(_style.copyWith(fontWeight: FontWeight.w700));

  // Font style methods
  AppTextStyle get italic =>
      AppTextStyle._(_style.copyWith(fontStyle: FontStyle.italic));

  // Font family methods
  AppTextStyle get poppins =>
      AppTextStyle._(_style.copyWith(fontFamily: 'poppins'));

  AppTextStyle get inter => AppTextStyle._(
    _style.copyWith(fontFamily: GoogleFonts.inter().fontFamily),
  );

  AppTextStyle get monospace =>
      AppTextStyle._(_style.copyWith(fontFamily: 'monospace'));
  AppTextStyle get spaceGrotesk =>
      AppTextStyle._(_style.copyWith(fontFamily: 'SpaceGrotesk'));

  AppTextStyle get lato => AppTextStyle._(
    _style.copyWith(fontFamily: GoogleFonts.lato().fontFamily),
  );

  AppTextStyle get playfairDisplay => AppTextStyle._(
    _style.copyWith(fontFamily: GoogleFonts.playfairDisplay().fontFamily),
  );

  // Height methods
  AppTextStyle height(double height) =>
      AppTextStyle._(_style.copyWith(height: height));
  AppTextStyle get defaultHeight =>
      AppTextStyle._(_style.copyWith(height: 1.2));
  AppTextStyle get mediumHeight => AppTextStyle._(_style.copyWith(height: 1.4));
  AppTextStyle get highHeight => AppTextStyle._(_style.copyWith(height: 1.5));

  // Letter spacing methods
  AppTextStyle letterSpacing(double spacing) =>
      AppTextStyle._(_style.copyWith(letterSpacing: spacing));

  // Color methods using coffee shop AppColors
  AppTextStyle get primary =>
      AppTextStyle._(_style.copyWith(color: AppColors.primary));
  AppTextStyle get primaryLight =>
      AppTextStyle._(_style.copyWith(color: AppColors.primaryLight));
  AppTextStyle get secondary =>
      AppTextStyle._(_style.copyWith(color: AppColors.secondary));

  AppTextStyle get background =>
      AppTextStyle._(_style.copyWith(color: AppColors.background));
  AppTextStyle get backgroundDark =>
      AppTextStyle._(_style.copyWith(color: AppColors.backgroundDark));
  AppTextStyle get surface =>
      AppTextStyle._(_style.copyWith(color: AppColors.surface));
  AppTextStyle get card =>
      AppTextStyle._(_style.copyWith(color: AppColors.card));

  AppTextStyle get text =>
      AppTextStyle._(_style.copyWith(color: AppColors.text));
  AppTextStyle get textSecondary =>
      AppTextStyle._(_style.copyWith(color: AppColors.textSecondary));
  AppTextStyle get textTertiary =>
      AppTextStyle._(_style.copyWith(color: AppColors.textTertiary));
  AppTextStyle get textOnDark =>
      AppTextStyle._(_style.copyWith(color: AppColors.textOnDark));

  AppTextStyle get border =>
      AppTextStyle._(_style.copyWith(color: AppColors.border));
  AppTextStyle get divider =>
      AppTextStyle._(_style.copyWith(color: AppColors.divider));

  AppTextStyle get success =>
      AppTextStyle._(_style.copyWith(color: AppColors.success));
  AppTextStyle get error =>
      AppTextStyle._(_style.copyWith(color: AppColors.error));

  // Coffee-specific colors
  AppTextStyle get espresso =>
      AppTextStyle._(_style.copyWith(color: AppColors.espresso));
  AppTextStyle get americano =>
      AppTextStyle._(_style.copyWith(color: AppColors.americano));
  AppTextStyle get mocha =>
      AppTextStyle._(_style.copyWith(color: AppColors.mocha));
  AppTextStyle get latte =>
      AppTextStyle._(_style.copyWith(color: AppColors.latte));
  AppTextStyle get cappuccino =>
      AppTextStyle._(_style.copyWith(color: AppColors.cappuccino));
  AppTextStyle get macchiato =>
      AppTextStyle._(_style.copyWith(color: AppColors.macchiato));

  // Dynamic color method for any Color value
  AppTextStyle color(Color color) =>
      AppTextStyle._(_style.copyWith(color: color));

  // Convert to TextStyle
  TextStyle get style => _style;

  // Method to copy with additional properties
  TextStyle copyWith({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? height,
    double? letterSpacing,
    FontStyle? fontStyle,
  }) => _style.copyWith(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    height: height,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
  );

  // Common static combinations for quick access
  static AppTextStyle get text10Regular => AppTextStyle().text10.regular;
  static AppTextStyle get text10Medium => AppTextStyle().text10.medium;
  static AppTextStyle get text10SemiBold => AppTextStyle().text10.semiBold;
  static AppTextStyle get text10Bold => AppTextStyle().text10.bold;

  static AppTextStyle get text12Regular => AppTextStyle().text12.regular;
  static AppTextStyle get text12Medium => AppTextStyle().text12.medium;
  static AppTextStyle get text12SemiBold => AppTextStyle().text12.semiBold;
  static AppTextStyle get text12Bold => AppTextStyle().text12.bold;

  static AppTextStyle get text14Regular => AppTextStyle().text14.regular;
  static AppTextStyle get text14Medium => AppTextStyle().text14.medium;
  static AppTextStyle get text14SemiBold => AppTextStyle().text14.semiBold;
  static AppTextStyle get text14Bold => AppTextStyle().text14.bold;

  static AppTextStyle get text16Regular => AppTextStyle().text16.regular;
  static AppTextStyle get text16Medium => AppTextStyle().text16.medium;
  static AppTextStyle get text16SemiBold => AppTextStyle().text16.semiBold;
  static AppTextStyle get text16Bold => AppTextStyle().text16.bold;

  static AppTextStyle get text18Regular => AppTextStyle().text18.regular;
  static AppTextStyle get text18Medium => AppTextStyle().text18.medium;
  static AppTextStyle get text18SemiBold => AppTextStyle().text18.semiBold;
  static AppTextStyle get text18Bold => AppTextStyle().text18.bold;

  static AppTextStyle get text20Regular => AppTextStyle().text20.regular;
  static AppTextStyle get text20Medium => AppTextStyle().text20.medium;
  static AppTextStyle get text20SemiBold => AppTextStyle().text20.semiBold;
  static AppTextStyle get text20Bold => AppTextStyle().text20.bold;

  static AppTextStyle get text24Regular => AppTextStyle().text24.regular;
  static AppTextStyle get text24Medium => AppTextStyle().text24.medium;
  static AppTextStyle get text24SemiBold => AppTextStyle().text24.semiBold;
  static AppTextStyle get text24Bold => AppTextStyle().text24.bold;

  static AppTextStyle get text28Bold => AppTextStyle().text28.bold;
  static AppTextStyle get text32Bold => AppTextStyle().text32.bold;
  static AppTextStyle get text36Bold => AppTextStyle().text36.bold;
}

// Legacy AppTextStyles class for backward compatibility and predefined styles
class AppTextStyles {
  // Display styles for large headings
  static TextStyle get displayLarge =>
      AppTextStyle().text40.bold.primary.poppins.height(1.2).style;
  static TextStyle get displayMedium =>
      AppTextStyle().text36.bold.primary.poppins.height(1.2).style;
  static TextStyle get displaySmall =>
      AppTextStyle().text32.semiBold.espresso.poppins.height(1.2).style;

  // Headings
  static TextStyle get heading1 =>
      AppTextStyle().text32.bold.espresso.poppins.height(1.2).style;
  static TextStyle get heading2 =>
      AppTextStyle().text28.bold.espresso.poppins.height(1.2).style;
  static TextStyle get heading3 =>
      AppTextStyle().text24.semiBold.text.poppins.height(1.3).style;
  static TextStyle get heading4 =>
      AppTextStyle().text20.semiBold.text.poppins.height(1.3).style;
  static TextStyle get heading5 =>
      AppTextStyle().text18.semiBold.text.inter.mediumHeight.style;
  static TextStyle get heading6 =>
      AppTextStyle().text16.semiBold.text.inter.mediumHeight.style;

  // Body text
  static TextStyle get bodyLarge =>
      AppTextStyle().text16.regular.text.inter.highHeight.style;
  static TextStyle get bodyMedium =>
      AppTextStyle().text14.regular.text.inter.highHeight.style;
  static TextStyle get bodySmall =>
      AppTextStyle().text12.regular.textSecondary.inter.mediumHeight.style;

  // Labels
  static TextStyle get labelLarge =>
      AppTextStyle().text14.medium.text.inter.mediumHeight.style;
  static TextStyle get labelMedium =>
      AppTextStyle().text12.medium.textSecondary.inter.height(1.3).style;
  static TextStyle get labelSmall =>
      AppTextStyle().text11.medium.textTertiary.inter.height(1.3).style;

  // Special styles
  static TextStyle get caption =>
      AppTextStyle().text12.regular.textTertiary.inter.height(1.3).style;
  static TextStyle get overline => AppTextStyle()
      .text10
      .medium
      .textSecondary
      .inter
      .height(1.6)
      .letterSpacing(1.5)
      .style;
  static TextStyle get button => AppTextStyle()
      .text14
      .semiBold
      .inter
      .mediumHeight
      .letterSpacing(0.5)
      .style;

  // Coffee shop specific styles
  static TextStyle get productName =>
      AppTextStyle().text18.semiBold.espresso.poppins.height(1.3).style;
  static TextStyle get productPrice =>
      AppTextStyle().text16.bold.primary.inter.height(1.2).style;
  static TextStyle get productDescription =>
      AppTextStyle().text14.regular.textSecondary.inter.highHeight.style;

  static TextStyle get categoryTitle =>
      AppTextStyle().text20.bold.espresso.poppins.height(1.2).style;
  static TextStyle get sectionTitle =>
      AppTextStyle().text16.semiBold.text.poppins.height(1.3).style;

  // Card styles
  static TextStyle get cardTitle =>
      AppTextStyle().text16.semiBold.espresso.poppins.height(1.3).style;
  static TextStyle get cardSubtitle =>
      AppTextStyle().text14.regular.textSecondary.inter.height(1.4).style;
  static TextStyle get cardCaption =>
      AppTextStyle().text12.regular.textTertiary.inter.height(1.3).style;

  // Input styles
  static TextStyle get inputLabel =>
      AppTextStyle().text14.medium.text.inter.height(1.3).style;
  static TextStyle get inputHint =>
      AppTextStyle().text14.regular.textTertiary.inter.height(1.4).style;
  static TextStyle get inputText =>
      AppTextStyle().text16.regular.text.inter.height(1.5).style;
  static TextStyle get inputError =>
      AppTextStyle().text12.regular.error.inter.height(1.3).style;

  // Navigation
  static TextStyle get navLabel =>
      AppTextStyle().text12.medium.textSecondary.inter.height(1.2).style;
  static TextStyle get navLabelActive =>
      AppTextStyle().text12.semiBold.primary.inter.height(1.2).style;

  // Special coffee menu styles
  static TextStyle get coffeeName =>
      AppTextStyle().text18.bold.espresso.playfairDisplay.height(1.3).style;
  static TextStyle get coffeeNameItalic => AppTextStyle()
      .text18
      .bold
      .espresso
      .playfairDisplay
      .italic
      .height(1.3)
      .style;
  static TextStyle get coffeeTag =>
      AppTextStyle().text12.medium.primary.inter.letterSpacing(0.5).style;
}
