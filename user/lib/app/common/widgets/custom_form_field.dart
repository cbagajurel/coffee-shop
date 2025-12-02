import 'package:circle_flags/circle_flags.dart';
import 'package:coffee_shop/utils/app_colors.dart';
import 'package:coffee_shop/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_country_selector/flutter_country_selector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class Country {
  final IsoCode isoCode;
  final String dialCode;
  final String name;

  Country(this.isoCode, this.dialCode, this.name);
}

abstract class FieldConfig {}

class DatePickerConfig extends FieldConfig {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateFormat? dateFormat;
  final String? helpText;
  final String? cancelText;
  final String? confirmText;
  final String? errorFormatText;
  final String? errorInvalidText;
  final String? fieldHelpText;
  final String? fieldLabelText;
  final Locale? locale;

  DatePickerConfig({
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.dateFormat,
    this.helpText,
    this.cancelText,
    this.confirmText,
    this.errorFormatText,
    this.errorInvalidText,
    this.fieldHelpText,
    this.fieldLabelText,
    this.locale,
  });
}

class TimePickerConfig extends FieldConfig {
  final TimeOfDay? initialTime;
  final String? helpText;
  final String? cancelText;
  final String? confirmText;
  final String? errorInvalidText;
  final String? hourLabelText;
  final String? minuteLabelText;
  final bool use24HourFormat;

  TimePickerConfig({
    this.initialTime,
    this.helpText,
    this.cancelText,
    this.confirmText,
    this.errorInvalidText,
    this.hourLabelText,
    this.minuteLabelText,
    this.use24HourFormat = false,
  });
}

class PasswordConfig extends FieldConfig {
  final bool showToggleIcon;
  final Widget? visibilityIcon;
  final Widget? visibilityOffIcon;
  final bool showPasswordStrength;
  final String? strengthText;

  PasswordConfig({
    this.showToggleIcon = true,
    this.visibilityIcon,
    this.visibilityOffIcon,
    this.showPasswordStrength = false,
    this.strengthText,
  });
}

class NumberConfig extends FieldConfig {
  final num? minValue;
  final num? maxValue;
  final int? decimalPlaces;
  final bool allowNegative;
  final num? stepValue;
  final bool showCounter;

  NumberConfig({
    this.minValue,
    this.maxValue,
    this.decimalPlaces,
    this.allowNegative = true,
    this.stepValue,
    this.showCounter = false,
  });
}

class PhoneConfig extends FieldConfig {
  final String? defaultCountryCode;
  final bool showCountryPicker;
  final bool showDialCode;
  final List<String>? favoriteCountries;
  final Function(Country isoCode)? onCountrySelected;

  PhoneConfig({
    this.defaultCountryCode,
    this.showCountryPicker = true,
    this.showDialCode = true,
    this.favoriteCountries,
    this.onCountrySelected,
  });
}

class MultilineConfig extends FieldConfig {
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool showCounter;
  final String? counterText;

  MultilineConfig({
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.showCounter = false,
    this.counterText,
  });
}

class EmailConfig extends FieldConfig {
  final bool allowMultiple;
  final String? emailSeparator;
  final List<String>? suggestedDomains;

  EmailConfig({
    this.allowMultiple = false,
    this.emailSeparator = ',',
    this.suggestedDomains,
  });
}

enum CustomFieldType {
  text,
  password,
  email,
  number,
  phone,
  multiline,
  datePicker,
  timePicker,
}

class CustomFormField extends StatefulWidget {
  static GlobalKey<_CustomFormFieldState> createKey() =>
      GlobalKey<_CustomFormFieldState>();

  final String? upperText;
  final String hintText;
  final double? formHeight;
  final TextEditingController? controller;
  final List<FormFieldValidator<String>>? validators;
  final CustomFieldType fieldType;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FieldConfig? fieldConfig;
  final ValueChanged<String>? onChanged;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final String? initialValue;
  final String? errorText;
  final TextStyle? hintTextStyle;
  final TextStyle? upperTextStyle;
  final TextStyle? initialTextStyle;
  final FocusNode? focusNode;
  const CustomFormField({
    super.key,
    required this.hintText,
    this.upperText,
    this.formHeight,
    this.controller,
    this.validators,
    this.fieldType = CustomFieldType.text,
    this.readOnly = false,
    this.onTap,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.fieldConfig,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.initialValue,
    this.errorText,
    this.initialTextStyle,
    this.hintTextStyle,
    this.upperTextStyle,
    this.focusNode,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _isPasswordVisible = false;
  Country? _selectedCountry;
  bool _hasInteracted = false;
  late final FocusNode _internalFocusNode;
  final GlobalKey<FormFieldState> _formFieldKey = GlobalKey<FormFieldState>();

  FocusNode get _focusNode => widget.focusNode ?? _internalFocusNode;

  @override
  void initState() {
    super.initState();

    if (widget.focusNode == null) {
      _internalFocusNode = FocusNode();
    }

    if (widget.controller != null) {
      widget.controller!.addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    }

    if (widget.fieldType == CustomFieldType.phone) {
      final config = widget.fieldConfig as PhoneConfig?;
      if (config?.defaultCountryCode != null) {
        _selectedCountry = Country(
          IsoCode.values.firstWhere(
            (iso) => iso.name == config!.defaultCountryCode,
            orElse: () => IsoCode.US,
          ),
          '+1',
          IsoCode.US.name,
        );
      }
    }
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _internalFocusNode.dispose();
    }
    super.dispose();
  }

  bool validate() {
    if (!_hasInteracted) {
      setState(() {
        _hasInteracted = true;
      });
    }
    return _formFieldKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.upperText != null
            ? Text(
                widget.upperText!,
                style:
                    widget.upperTextStyle ??
                    AppTextStyle.text14Medium.primary.style,
              )
            : SizedBox(),
        5.verticalSpace,
        TextFormField(
          key: _formFieldKey,

          initialValue: widget.controller != null ? null : widget.initialValue,
          style: widget.initialTextStyle,
          textCapitalization: widget.textCapitalization,
          onChanged: (value) {
            if (!_hasInteracted) {
              setState(() {
                _hasInteracted = true;
              });
            }
            widget.onChanged?.call(value);
          },
          autovalidateMode: _hasInteracted
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          focusNode: _focusNode,
          minLines: _getMinLines(),
          maxLines: _getMaxLines(),
          maxLength: _getMaxLength(),
          controller: widget.controller,
          validator: FormBuilderValidators.compose([
            ...widget.validators ?? [],
          ]),
          obscureText: _isObscureText(),
          keyboardType: _getKeyboardType(),
          readOnly: widget.readOnly || _isPickerField(),
          onTap: _handleTap,
          textInputAction: widget.textInputAction,
          inputFormatters: _getInputFormatters(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            hintText: widget.hintText,
            hintStyle:
                widget.hintTextStyle ??
                AppTextStyle.text14Medium.textTertiary.style,
            filled: true,
            fillColor: AppColors.card,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.border, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.border, width: 1),
            ),
            isDense: true,
            errorText:
                (widget.errorText != null && widget.errorText!.isNotEmpty) &&
                    _hasInteracted
                ? widget.errorText
                : null,
            errorStyle: AppTextStyle.text12Medium.error.copyWith(
              fontSize: 10.sp,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.error, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.error, width: 1),
            ),
            suffixIcon: _buildSuffixIcon(),
            suffixIconConstraints: const BoxConstraints(
              minHeight: 0,
              minWidth: 0,
            ),
            prefixIcon: _buildPrefixIcon(),
            counterText: _getCounterText(),
          ),
        ),
      ],
    );
  }

  int _getMinLines() {
    if (widget.fieldType == CustomFieldType.multiline) {
      final config = widget.fieldConfig as MultilineConfig?;
      return config?.minLines ??
          (widget.formHeight != null ? (widget.formHeight! / 24).floor() : 3);
    }
    return 1;
  }

  int? _getMaxLines() {
    if (widget.fieldType == CustomFieldType.multiline) {
      final config = widget.fieldConfig as MultilineConfig?;
      return config?.maxLines;
    }
    return 1;
  }

  int? _getMaxLength() {
    if (widget.fieldType == CustomFieldType.multiline) {
      final config = widget.fieldConfig as MultilineConfig?;
      return config?.maxLength;
    }
    return null;
  }

  List<TextInputFormatter>? _getInputFormatters() {
    List<TextInputFormatter> formatters = [];

    switch (widget.fieldType) {
      case CustomFieldType.number:
        break;
      case CustomFieldType.phone:
        formatters.add(FilteringTextInputFormatter.digitsOnly);
        break;
      case CustomFieldType.email:
        formatters.add(FilteringTextInputFormatter.deny(RegExp(r'\s')));
        break;
      default:
        break;
    }

    return formatters.isNotEmpty ? formatters : null;
  }

  String? _getCounterText() {
    if (widget.fieldType == CustomFieldType.multiline) {
      final config = widget.fieldConfig as MultilineConfig?;
      if (config?.showCounter == true) {
        return config?.counterText ?? "";
      }
    }
    return null;
  }

  bool _isObscureText() {
    return widget.fieldType == CustomFieldType.password && !_isPasswordVisible;
  }

  TextInputType _getKeyboardType() {
    switch (widget.fieldType) {
      case CustomFieldType.email:
        return TextInputType.emailAddress;
      case CustomFieldType.number:
        return TextInputType.number;
      case CustomFieldType.phone:
        return TextInputType.phone;
      case CustomFieldType.multiline:
        return TextInputType.multiline;
      default:
        return TextInputType.text;
    }
  }

  bool _isPickerField() {
    return widget.fieldType == CustomFieldType.datePicker ||
        widget.fieldType == CustomFieldType.timePicker;
  }

  void _handleTap() {
    if (widget.onTap != null) {
      widget.onTap!();
    } else if (widget.fieldType == CustomFieldType.datePicker) {
      _showDatePicker();
    } else if (widget.fieldType == CustomFieldType.timePicker) {
      _showTimePicker();
    }
  }

  Widget? _buildSuffixIcon() {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    }

    if (widget.suffix != null) {
      return widget.suffix;
    }

    if (widget.fieldType == CustomFieldType.password) {
      final config = widget.fieldConfig as PasswordConfig?;
      if (config?.showToggleIcon == false) return null;

      return IconButton(
        icon: _isPasswordVisible
            ? (config?.visibilityOffIcon ??
                  Icon(Icons.visibility_off, color: AppColors.textTertiary))
            : (config?.visibilityIcon ??
                  Icon(Icons.visibility, color: AppColors.textTertiary)),
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
      );
    }

    if (widget.fieldType == CustomFieldType.datePicker) {
      return Icon(Icons.calendar_today, color: AppColors.textTertiary);
    }

    if (widget.fieldType == CustomFieldType.timePicker) {
      return Icon(Icons.access_time, color: AppColors.textTertiary);
    }

    return null;
  }

  Widget? _buildPrefixIcon() {
    if (widget.prefixIcon != null) {
      return widget.prefixIcon;
    }

    if (widget.fieldType == CustomFieldType.phone) {
      final config = widget.fieldConfig as PhoneConfig?;
      if (config?.showCountryPicker == true) {
        return GestureDetector(
          onTap: _showCountryPicker,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: AppColors.border, width: 1),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleFlag(
                  _selectedCountry?.isoCode.name ?? 'US',
                  size: 24,
                  key: ValueKey(
                    'circle-flag-${_selectedCountry?.name ?? 'US'}',
                  ),
                ),
                if (config?.showDialCode == true) ...[
                  6.horizontalSpace,
                  Text(
                    _selectedCountry?.dialCode ?? 'US',
                    style: AppTextStyle.text14Medium.primary.style,
                  ),
                ],
                2.horizontalSpace,
                Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.textTertiary,
                  size: 16,
                ),
              ],
            ),
          ),
        );
      }
    }

    return null;
  }

  Future<void> _showCountryPicker() async {
    final config = widget.fieldConfig as PhoneConfig?;
    if (config == null) return;

    final result = await showModalBottomSheet<Country>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.25,
        maxChildSize: 0.85,
        expand: false,
        builder: (context, scrollController) {
          return CountrySelector.sheet(
            onCountrySelected: (country) => Navigator.of(context).pop(country),
            addFavoritesSeparator: true,
            favoriteCountries: config.favoriteCountries?.isNotEmpty == true
                ? config.favoriteCountries!
                      .map(
                        (code) => IsoCode.values.firstWhere(
                          (iso) => iso.name == code,
                          orElse: () => IsoCode.US,
                        ),
                      )
                      .toList()
                : [IsoCode.US],
            showDialCode: config.showDialCode,
          );
        },
      ),
      isScrollControlled: true,
    );

    if (result != null) {
      setState(() {
        _selectedCountry = result;
      });
      config.onCountrySelected?.call(result);
    }
  }

  Future<void> _showDatePicker() async {
    final config = widget.fieldConfig as DatePickerConfig?;
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: config?.initialDate ?? DateTime.now(),
      firstDate: config?.firstDate ?? DateTime(1900),
      lastDate: config?.lastDate ?? DateTime(2100),
      helpText: config?.helpText,
      cancelText: config?.cancelText,
      confirmText: config?.confirmText,
      errorFormatText: config?.errorFormatText,
      errorInvalidText: config?.errorInvalidText,
      fieldLabelText: config?.fieldLabelText,
      locale: config?.locale,
    );

    if (pickedDate != null && widget.controller != null) {
      final format = config?.dateFormat ?? DateFormat('dd/MM/yyyy');
      final formattedDate = format.format(pickedDate);
      widget.controller!.text = formattedDate;
      // Trigger onChanged callback to track the change
      widget.onChanged?.call(formattedDate);
    }
  }

  Future<void> _showTimePicker() async {
    final config = widget.fieldConfig as TimePickerConfig?;
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: config?.initialTime ?? TimeOfDay.now(),
      helpText: config?.helpText,
      cancelText: config?.cancelText,
      confirmText: config?.confirmText,
      errorInvalidText: config?.errorInvalidText,
      hourLabelText: config?.hourLabelText,
      minuteLabelText: config?.minuteLabelText,
      builder: config?.use24HourFormat == true
          ? (context, child) {
              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(alwaysUse24HourFormat: true),
                child: child!,
              );
            }
          : null,
    );

    if (pickedTime != null && widget.controller != null) {
      String formattedTime;
      if (config?.use24HourFormat == true) {
        formattedTime =
            "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}";
      } else {
        formattedTime = pickedTime.format(context);
      }
      widget.controller!.text = formattedTime;
      // Trigger onChanged callback to track the change
      widget.onChanged?.call(formattedTime);
    }
  }
}

class CustomDropdownField<T> extends StatelessWidget {
  final String upperText;
  final String hintText;
  final TextStyle? upperTextStyle;
  final TextStyle? hintTextStyle;

  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<T>? validator;
  final Widget? prefixIcon;

  const CustomDropdownField({
    super.key,
    required this.upperText,
    required this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.upperTextStyle,
    this.hintTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          upperText,
          style: upperTextStyle ?? AppTextStyle.text14Medium.primary.style,
        ),
        5.verticalSpace,
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          validator: validator,
          style: hintTextStyle ?? AppTextStyle.text14Medium.textTertiary.style,
          selectedItemBuilder: (context) => items
              .map(
                (i) => Align(
                  alignment: Alignment.centerLeft,
                  child: DefaultTextStyle(
                    style:
                        hintTextStyle ??
                        AppTextStyle.text14Medium.textTertiary.style,
                    child: i.child,
                  ),
                ),
              )
              .toList(),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 8.h,
              horizontal: 12.w,
            ),
            hint: Align(
              alignment: Alignment.topLeft,
              child: Text(
                hintText,
                style:
                    hintTextStyle ??
                    AppTextStyle.text14Medium.textTertiary.style,
              ),
            ),

            filled: true,
            fillColor: AppColors.card,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.border, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.border, width: 1),
            ),
            isDense: true,
            errorStyle: AppTextStyle.text12Bold.error.copyWith(fontSize: 12.sp),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.error, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.error, width: 1),
            ),
            prefixIcon: prefixIcon,
          ),
          icon: Icon(Icons.keyboard_arrow_down, color: AppColors.textTertiary),
          dropdownColor: AppColors.card,
        ),
      ],
    );
  }
}
