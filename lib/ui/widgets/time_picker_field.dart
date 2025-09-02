// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:intl/intl.dart';

class TimePickerfield extends StatefulWidget {
  final String? label;
  final String? value;
  final String? placeholder;
  final bool? validate;
  final ValueChanged<TimeOfDay> onTimeSelected;
  final bool enabled;
  final bool? greyLabelStyle;
  final TextEditingController? controller;
  final double? radius;
  final Widget? prefixIcon;
  final Color? filledColor;

  const TimePickerfield(
      {super.key,
      this.label,
      this.value,
      this.placeholder,
      this.validate,
      this.filledColor,
      this.radius,
      this.prefixIcon,
      this.controller,
      required this.onTimeSelected,
      this.enabled = true,
      this.greyLabelStyle = false});

  @override
  State<TimePickerfield> createState() => _TimePickerfieldState();
}

class _TimePickerfieldState extends State<TimePickerfield> {
  String time = '';
  late DateTime dateTime;
  // final TextEditingController dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // if (widget.initialDate != null) {
    //   dateTime = widget.initialDate!;
    // } else {
    //   dateTime = DateTime(
    //       DateTime.now().year, DateTime.now().month, DateTime.now().day);
    // }
    // if (widget.value != null) widget.controller!.text = widget.value!;
    if (widget.value != null) {
      time = widget.value!;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.value != null) {
      time = widget.value!;
      log(time);
    }
  }

  TimeOfDay _selectedTime = TimeOfDay.now();

  // Function to display the time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      final now = DateTime.now();
      final DateTime timeSelected =
          DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      final formattedTime = DateFormat('HH:mm').format(timeSelected);
      setState(() {
        _selectedTime = picked;
        log('Selected Time: $_selectedTime');
        time = formattedTime;
        log('Time: $time');
        widget.controller?.text = formattedTime;
        widget.onTimeSelected(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap:
              widget.enabled ? () async => await _selectTime(context) : () {},
          borderRadius: BorderRadius.circular(4.r),
          child: CustomTextField(
            controller: widget.controller,
            label: widget.label,
            radius: widget.radius,
            prefixIcon: widget.prefixIcon,
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
