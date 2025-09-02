// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
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

  const DatePickerfield(
      {super.key,
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
      this.greyLabelStyle = false});

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
      dateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.value != null) {
      date = widget.value!;
      log(date);
    }
    if (widget.initialDate != null) {
      dateTime = widget.initialDate!;
    } else {
      dateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
              : () {},
          borderRadius: BorderRadius.circular(4.r),
          child: CustomTextField(
            controller: widget.controller,
            label: widget.label,
            radius: widget.radius,
            prefixIcon: widget.prefixIcon,
            style: widget.style,
            inputBorder: widget.inputBorder,
            labelText: widget.placeholder,
            fillColor: widget.filledColor ?? Colors.transparent,
            hintText: widget.placeholder,
            suffixConstraint: BoxConstraints(minWidth: 50.w),
            enabled: false,
          ),
        ),
      ],
    );
  }
}

Future showPicker(
    {required BuildContext context,
    required DateTime initialDate,
    DateTime? startDate,
    DateTime? stopDate,
    required ValueChanged<DateTime> onComplete}) async {
  final ThemeData theme = Theme.of(context);
  switch (theme.platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: startDate ?? DateTime(1800),
        lastDate: stopDate ?? DateTime(2050),
      ).then((value) {
        if (value != null) {
          onComplete(value);
        }
      });
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return showModalBottomSheet(
          context: context,
          builder: (BuildContext builder) {
            return Container(
              height: 300.h,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (value) {
                  onComplete(value);
                },
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                initialDateTime: initialDate,
                minimumYear: startDate?.year ?? DateTime(1800).year,
                maximumYear: stopDate?.year ?? DateTime(2050).year,
                minimumDate: startDate ?? DateTime(1800),
                maximumDate: stopDate ?? DateTime(2050),
              ),
            );
          });
  }
}
