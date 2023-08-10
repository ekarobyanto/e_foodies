import 'package:e_foodies/src/core/bloc/app_bloc.dart';
import 'package:e_foodies/src/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/styles.dart';
import '../../../../../utills/email_validator.dart';
import '../../../../shared/shrink_property.dart';
import '../../../../shared/text_input.dart';

class RegisterContent extends StatefulWidget {
  RegisterContent({super.key, required this.prevRoute});

  String prevRoute;

  @override
  State<RegisterContent> createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SizedBox(
        height: 1.sh * 0.92,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
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
                    disableInput: context.read<AppBloc>().state ==
                        const AppState.loading(),
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
                    label: 'Alamat',
                    hint: 'Masukan alamat anda',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Alamat tidak boleh kosong';
                      }
                      return null;
                    },
                    textController: _addressCtrl,
                  ),
                  TextInput(
                    disableInput: context.read<AppBloc>().state ==
                        const AppState.loading(),
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
                ],
              ),
              Column(
                children: [
                  BlocBuilder<AppBloc, AppState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return ShrinkProperty(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AppBloc>().add(
                                      const AppEvent.loadingRequested(),
                                    );
                                context.read<RegisterBloc>().add(
                                      RegisterEvent.register(
                                        name: _nameCtrl.text,
                                        email: _emailCtrl.text,
                                        address: _addressCtrl.text,
                                        password: _passwordCtrl.text,
                                      ),
                                    );
                              }
                            },
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
                                style: Styles.font.base
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          );
                        },
                        loading: () {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Styles.color.primary,
                            ),
                          );
                        },
                      );
                    },
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
                        onTap: () {
                          if (widget.prevRoute == 'login') {
                            context.pop();
                          } else {
                            context.push('/login', extra: 'register');
                          }
                        },
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
            ],
          ),
        ),
      ),
    );
  }
}
