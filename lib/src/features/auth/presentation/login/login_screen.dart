import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/styles.dart';
import '../../../../utills/email_validator.dart';
import '../../../shared/shrink_property.dart';
import '../../../shared/text_input.dart';
import '../widgets/auth_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          backgroundColor: Styles.color.darkGreen,
        ),
        body: SingleChildScrollView(
          child: AuthBackground(
            child: LoginContent(
              emailCtrl: _emailCtrl,
              passwordCtrl: _passwordCtrl,
            ),
          ),
        ),
      ),
    );
  }
}

class LoginContent extends StatelessWidget {
  const LoginContent(
      {super.key, required this.emailCtrl, required this.passwordCtrl});
  final TextEditingController emailCtrl;
  final TextEditingController passwordCtrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SizedBox(
        height: 1.sh * 0.92,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Text(
                  'Masuk',
                  style: Styles.font.bxl6,
                ),
                SizedBox(
                  height: 60.h,
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
                  textController: emailCtrl,
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
                  textController: passwordCtrl,
                ),
              ],
            ),
            Column(
              children: [
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
                      'Masuk',
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
                      'Belum punya akun? ',
                      style: Styles.font.base,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Daftar',
                        style: Styles.font.base.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
