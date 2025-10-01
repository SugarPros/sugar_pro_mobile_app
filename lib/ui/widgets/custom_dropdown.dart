import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?> onChanged;
  final bool enabled, loading;
  final TextStyle? style;
  final String? helperText;
  final bool arrowColor;
  final bool? greyLabelStyle;
  final Color? bgColor;
  final Color? borderColor;
  final Widget? prefixIcon;

  const CustomDropdown({
    super.key,
    this.label,
    this.hint,
    this.bgColor,
    this.borderColor,
    required this.value,
    required this.items,
    required this.onChanged,
    this.greyLabelStyle = false,
    this.style,
    this.helperText,
    this.loading = false,
    this.enabled = true,
    this.arrowColor = false,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == null
            ? const SizedBox()
            : Container(
              margin: EdgeInsets.only(bottom: 1.h),
              child: Text(
                label!,
                style: BrandTextStyles.medium.copyWith(
                  fontSize: 14.sp,
                  color: const Color(0xFF000B09),
                ),
              ),
            ),
        loading
            ? const DropDownLoader()
            : DropdownButtonFormField2(
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              validator: (value) => value == null ? 'Select a value' : null,
              isExpanded: true,
              isDense: true,
              hint: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  hint ?? '',
                  style:
                      style ??
                      BrandTextStyles.regular.copyWith(
                        fontSize: 14.sp,
                        color: hexColor('#64748B')
                      ),
                ),
              ),
              customButton: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  right: 7.w,
                  top: 14.h,
                  bottom: 14.h,
                  left: 10.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: borderColor ?? hexColor('#D1D5DC'),
                  ),
                  color: bgColor ?? hexColor('#F8FAFC'),
                ),
                child: Row(
                  children: [
                    if (prefixIcon != null) ...[
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: prefixIcon!,
                      ),
                    ],
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child:
                            value == null
                                ? Text(
                                  hint ?? '',
                                  style: BrandTextStyles.regular.copyWith(
                                    fontSize: 14.sp,
                                    color: hexColor('#64748B')
                                  ),
                                )
                                : items
                                        ?.firstWhere((e) => e.value == value)
                                        .child ??
                                    const SizedBox(),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: BrandColors.bc848484,
                      size: 20.h,
                    ),
                  ],
                ),
              ),
              iconStyleData: IconStyleData(
                icon:
                    enabled
                        ? Icon(
                          Icons.keyboard_arrow_down,
                          color: BrandColors.bc848484,
                          size: 20.h,
                        )
                        : const SizedBox(),
                iconSize: 20.h,
                iconEnabledColor: BrandColors.bc848484,
                iconDisabledColor: Colors.grey,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200.h,
                width: MediaQuery.of(context).size.width * 0.93,
                elevation: 1,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: hexColor('#EDEDED'),
                ),
                offset: Offset(0.w, -3.h),
                scrollbarTheme: ScrollbarThemeData(
                  radius: Radius.circular(40.r),
                  thickness: WidgetStateProperty.all(6),
                  thumbVisibility: WidgetStateProperty.all(true),
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 40.h,
                padding: EdgeInsets.only(left: 14.w, right: 14.w),
              ),
              value: value,
              items: items,
              onChanged: onChanged,
            ),
        helperText == null ? const SizedBox.shrink() : SizedBox(height: 6.h),
        helperText == null
            ? const SizedBox.shrink()
            : Text(
              helperText!,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: 12.sp,
                color: BrandColors.grey9c,
              ),
            ),
      ],
    );
  }
}

class DropDownLoader extends StatelessWidget {
  const DropDownLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      decoration: BoxDecoration(
        color: BrandColors.bcFAFAFA,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: const Color(0xFFD0D5DD)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20.h,
            height: 20.h,
            child: const CircularProgressIndicator(strokeWidth: 2),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              'Loading',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: 14.sp,
                color: const Color(0xFFACACAC),
              ),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: const Color(0xFF718096).withValues(alpha: 0.5),
            size: 26.h,
          ),
        ],
      ),
    );
  }
}
