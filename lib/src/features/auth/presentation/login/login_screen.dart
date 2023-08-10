import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/styles.dart';
import '../../../../core/bloc/app_bloc.dart';
import '../../../../utills/email_validator.dart';
import '../../../shared/shrink_property.dart';
import '../../../shared/text_input.dart';
import '../../../shared/background.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key, required this.prevRoute});
  String prevRoute;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          child: Background(
            child: LoginContent(
              prevRoute: widget.prevRoute,
            ),
          ),
        ),
      ),
    );
  }
}

class LoginContent extends StatelessWidget {
  LoginContent({super.key, required this.prevRoute});
  String prevRoute;

  @override
  Widget build(BuildContext context) {
    final _emailCtrl = TextEditingController();
    final _passwordCtrl = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SizedBox(
        height: 1.sh * 0.92,
        child: Form(
          key: _formKey,
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
                    disableInput: context.read<AppBloc>().state ==
                        const AppState.loading(),
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
                    disableInput: context.read<AppBloc>().state ==
                        const AppState.loading(),
                    label: 'Password',
                    hint: 'Masukan password anda',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                    textController: _passwordCtrl,
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
                        onTap: () {
                          if (prevRoute == 'register') {
                            context.pop();
                          } else {
                            context.push('/register', extra: 'login');
                          }
                        },
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
      ),
    );
  }
}
