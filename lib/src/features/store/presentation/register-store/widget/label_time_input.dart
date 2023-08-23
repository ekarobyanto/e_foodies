import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/styles.dart';

class LabelTimeInput extends StatefulWidget {
  LabelTimeInput({
    super.key,
    required this.timeController,
    required this.label,
    required this.validator,
    required this.disableInput,
  });

  final String? Function(String?)? validator;
  final TextEditingController timeController;
  String label;
  bool disableInput;

  @override
  State<LabelTimeInput> createState() => _LabelTimeInputState();
}

class _LabelTimeInputState extends State<LabelTimeInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Styles.font.bsm,
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: 0.4.sw,
          child: TextFormField(
            readOnly: true,
            enabled: !widget.disableInput,
            validator: widget.validator,
            controller: widget.timeController,
            style: Styles.font.bold.copyWith(fontWeight: FontWeight.w500),
            textAlignVertical: TextAlignVertical.center,
            onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                initialTime: TimeOfDay.now(),
                context: context,
              );

              if (pickedTime != null) {
                log('${pickedTime.hour}:${pickedTime.minute}');
                String hourFormat = pickedTime.hour.toString().length < 2
                    ? '0${pickedTime.hour}'
                    : pickedTime.hour.toString();
                String minuteFormat = pickedTime.minute.toString().length < 2
                    ? '0${pickedTime.minute}'
                    : pickedTime.minute.toString();
                setState(() {
                  widget.timeController.text = '$hourFormat:$minuteFormat';
                });
              } else {
                log("Time is not selected");
              }
            },
            decoration: Styles.input.accent.copyWith(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              hintText: widget.label,
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Styles.color.primary,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Styles.color.primary,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Styles.color.danger,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[300]!,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              errorStyle: Styles.font.sm.copyWith(color: Styles.color.danger),
            ),
          ),
        ),
      ],
    );
  }
}
