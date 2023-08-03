import 'package:e_foodies/src/constants/styles.dart';
import 'package:e_foodies/src/features/shared/shrink_property.dart';
import 'package:e_foodies/src/features/shared/text_input.dart';
import 'package:e_foodies/src/utills/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameCtrl = TextEditingController();
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
        body: Stack(
          children: [
            // SizedBox(
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            //   child: Column(),
            // ),
            Positioned(
              right: -50,
              top: -50,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Styles.color.darkGreen),
              ),
            ),
            Positioned(
              left: 40,
              top: -20,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Styles.color.primary),
              ),
            ),
            Positioned(
              left: -50,
              top: -50,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Styles.color.accent),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                          if (!validateEmail(value))
                            return 'Masukan email valid';
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
                            style:
                                Styles.font.base.copyWith(color: Colors.white),
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
                              style:
                                  Styles.font.base.copyWith(color: Colors.grey),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
