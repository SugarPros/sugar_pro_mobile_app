// ignore_for_file: deprecated_member_use

import 'package:sugar_pros/core/utils/exports.dart';

class DatePickerfield extends StatefulWidget {
  final String? label;
  final String? value;
  final String? placeholder;
  final DateTime? stopDate;
  final DateTime? startDate;
  final DateTime? initialDate;
  final bool? validate;
  final ValueChanged<DateTime> onDateSelected;
  final bool enabled;
  final bool? greyLabelStyle;
  final TextEditingController? controller;
  final double? radius;
  final Widget? prefixIcon;
  final Color? filledColor;
  final TextStyle? style;
  final OutlineInputBorder? inputBorder;

  const DatePickerfield({
    super.key,
    this.label,
    this.value,
    this.placeholder,
    this.inputBorder,
    this.validate,
    this.filledColor,
    this.radius,
    this.prefixIcon,
    this.style,
    this.stopDate,
    this.startDate,
    this.initialDate,
    this.controller,
    required this.onDateSelected,
    this.enabled = true,
    this.greyLabelStyle = false,
  });

  @override
  State<DatePickerfield> createState() => _DatePickerfieldState();
}

class _DatePickerfieldState extends State<DatePickerfield> {
  String date = '';
  late DateTime dateTime;

  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      date = widget.value!;
    }
    if (widget.initialDate != null) {
      dateTime = widget.initialDate!;
    } else {
      dateTime = DateTime.now();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.value != null) {
      date = widget.value!;
    }
    if (widget.initialDate != null) {
      dateTime = widget.initialDate!;
    } else {
      dateTime = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: widget.enabled
              ? () async => await showPicker(
                    context: context,
                    initialDate: dateTime,
                    startDate: widget.startDate,
                    stopDate: widget.stopDate,
                    onComplete: (value) {
                      setState(() {
                        date = DateFormatUtil.yyyymmdd.format(value);
                        dateTime = value;
                        widget.controller?.text = date;
                        widget.onDateSelected(value);
                      });
                    },
                  )
              : null,
          borderRadius: BorderRadius.circular(4.r),
          child: CustomTextField(
            controller: widget.controller,
            label: widget.label,
            radius: widget.radius,
            suffixIcon: widget.prefixIcon,
            style: widget.style,
            inputBorder: widget.inputBorder,
            labelText: widget.placeholder,
            hintText: widget.placeholder,
            suffixConstraint: BoxConstraints(minWidth: 50.w),
            enabled: false,
          ),
        ),
      ],
    );
  }
}

/// Flexible Material (Android-style) date picker for ALL platforms
Future showPicker({
  required BuildContext context,
  required DateTime initialDate,
  DateTime? startDate,
  DateTime? stopDate,
  required ValueChanged<DateTime> onComplete,
}) async {
  // final DateTime today = DateTime(
  //   DateTime.now().year,
  //   DateTime.now().month,
  //   DateTime.now().day,
  // );

  // Default ranges if not provided
  final DateTime firstDate = startDate ?? DateTime(1800);
  final DateTime lastDate = stopDate ?? DateTime(2050);

  // Ensure initialDate stays within range
  final DateTime safeInitialDate = initialDate.isBefore(firstDate)
      ? firstDate
      : (initialDate.isAfter(lastDate) ? lastDate : initialDate);

  return showDatePicker(
    context: context,
    initialDate: safeInitialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.teal, // header background color
            onPrimary: Colors.white, // header text color
            onSurface: Colors.black, // body text color
          ),
          dialogBackgroundColor: Colors.white,
        ),
        child: child!,
      );
    },
  ).then((value) {
    if (value != null) {
      onComplete(value);
    }
  });
}