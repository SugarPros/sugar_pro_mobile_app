import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class CustomPhoneField extends StatelessWidget {
  final String label;
  final String? errorText;
  final String? hintText;
  final bool isRequired;
  final bool validate;
  final String? initialValue;
  final ValueChanged<PhoneNumber?> onChanged;
  final TextEditingController? controller;

  const CustomPhoneField({
    super.key,
    required this.label,
    this.errorText,
    this.initialValue,
    required this.onChanged,
    this.hintText,
    this.isRequired = false,
    required this.validate,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 6.h, left: 0.h),
          child: RichText(
            text: TextSpan(
              text: label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: hexColor('#041915'),
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: isRequired ? '*' : '',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFE41613),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
        IntlPhoneField(
          controller: controller,
          initialCountryCode: 'US',
          initialValue: initialValue,
          disableLengthCheck: true,
          pickerDialogStyle: PickerDialogStyle(
            countryNameStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF152451),
            ),
            countryCodeStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Color(0xFF152451),
            ),
            listTilePadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 8.w),
            listTileDivider: Divider(color: Color(0xFFA9B7DE), thickness: .2),
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            searchFieldPadding: EdgeInsets.zero,
            searchFieldCursorColor: Color(0xFFA9B7DE),
            searchFieldInputDecoration: InputDecoration(
              filled: true,
              fillColor: hexColor('#F8FAFC'),
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12.sp,
                color: Color(0xFFA9B7DE),
                fontWeight: FontWeight.w600,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0XFFD1D5DC)),
                borderRadius: BorderRadius.circular(8.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: hexColor('#2889AA')),
                borderRadius: BorderRadius.circular(8.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: hexColor('#D1D5DC')),
                borderRadius: BorderRadius.circular(8.r),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            ),
          ),
          dropdownIconPosition: IconPosition.trailing,
          flagsButtonPadding: EdgeInsets.only(left: 24.w),
          showCountryFlag: false,
          dropdownTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 12.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          showDropdownIcon: true,
          dropdownIcon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Color(0xFFACACAC),
            size: 18.h,
          ),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 14.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          cursorColor: BrandColors.primary,
          validator: (val) {
            if (validate) {
              if (val == null) {
                return 'Invalid Entry';
              } else {
                if (val.number.isEmpty) {
                  return 'Field cannot be empty';
                } else if (val.number.trim().isEmpty) {
                  return 'Field cannot be empty';
                } else if (int.tryParse(val.number) == null) {
                  return 'Invalid entry';
                } else if (val.number.length < 10) {
                  return 'Invalid entry';
                }
              }
            }
            return null;
          },
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          decoration: InputDecoration(
            fillColor: hexColor('#F8FAFC'),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 12.sp,
              color: Color(0xFFACACAC),
              fontWeight: FontWeight.w400,
            ),
            suffixStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0XFFD1D5DC)),
              borderRadius: BorderRadius.circular(8.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: hexColor('#2889AA')),
              borderRadius: BorderRadius.circular(8.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: hexColor('#D1D5DC')),
              borderRadius: BorderRadius.circular(8.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8.r),
            ),
            errorText: errorText,
            errorStyle: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.red, fontSize: 10.sp),
            contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
