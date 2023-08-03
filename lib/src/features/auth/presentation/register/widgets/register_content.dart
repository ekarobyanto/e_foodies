import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/styles.dart';
import '../../../../../utills/email_validator.dart';
import '../../../../shared/shrink_property.dart';
import '../../../../shared/text_input.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({
    super.key,
    required TextEditingController nameCtrl,
    required TextEditingController emailCtrl,
    required TextEditingController passwordCtrl,
  })  : _nameCtrl = nameCtrl,
        _emailCtrl = emailCtrl,
        _passwordCtrl = passwordCtrl;

  final TextEditingController _nameCtrl;
  final TextEditingController _emailCtrl;
  final TextEditingController _passwordCtrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Text(
              'Daftar',
              style: Styles.font.bxl6,
            ),
            SizedBox(
              height: 60.h,
            ),
            TextInput(
              label: 'Nama',
              hint: 'Masukan nama anda',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama tidak boleh kosong';
                }
                return null;
              },
              textController: _nameCtrl,
            ),
            TextInput(
              label: 'Email',
              hint: 'Masukan email anda',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email tidak boleh kosong';
                }
                if (!validateEmail(value)) {
                  return 'Masukan email valid';
                }
                return null;
              },
              textController: _emailCtrl,
            ),
            TextInput(
              label: 'Password',
              hint: 'Masukan 8 karakter atau lebih',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                if (value.length < 8) {
                  return 'Password harus 8 karakter atau lebih';
                }
                return null;
              },
              textController: _passwordCtrl,
            ),
            const SizedBox(
              height: 150,
            ),
            ShrinkProperty(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Styles.color.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Daftar',
                  style: Styles.font.base.copyWith(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Styles.color.hint,
                      thickness: 1,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    'atau',
                    style: Styles.font.base.copyWith(color: Colors.grey),
                  ),
                  Expanded(
                    child: Divider(
                      color: Styles.color.hint,
                      thickness: 1,
                      indent: 10,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah punya akun? ',
                  style: Styles.font.base,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Masuk',
                    style: Styles.font.base.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
