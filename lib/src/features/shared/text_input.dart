// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/styles.dart';

class TextInput extends StatefulWidget {
  TextInput({
    super.key,
    required this.label,
    required this.hint,
    required this.validator,
    required this.textController,
  });

  final String label;
  final String hint;
  final String? Function(String?)? validator;
  TextEditingController textController;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Styles.font.bsm,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200]!, width: 1.5),
            borderRadius: BorderRadius.circular(
              10.r,
            ),
          ),
          child: TextFormField(
            style: Styles.font.bold.copyWith(fontWeight: FontWeight.w500),
            textAlignVertical: TextAlignVertical.center,
            obscureText:
                widget.label.contains('Password') ? _isObsecure : false,
            validator: widget.validator,
            onChanged: (value) => widget.textController.text = value,
            decoration: Styles.input.accent.copyWith(
              contentPadding: EdgeInsets.symmetric(
                vertical: widget.label.contains('Password') ? 10 : 15,
                horizontal: 10,
              ),
              hintText: widget.hint,
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
              errorStyle: Styles.font.sm.copyWith(color: Styles.color.danger),
              suffixIcon: widget.label.contains('Password')
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _isObsecure = !_isObsecure;
                        });
                      },
                      icon: Icon(
                        _isObsecure ? Icons.visibility : Icons.visibility_off,
                        color: Styles.color.hint,
                      ),
                    )
                  : null,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
