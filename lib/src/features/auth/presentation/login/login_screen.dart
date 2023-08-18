// ignore_for_file: must_be_immutable

import 'package:e_foodies/src/core/bloc/account/account_bloc.dart';
import 'package:e_foodies/src/core/data/storage/storage_repository.dart';
import 'package:e_foodies/src/features/auth/data/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/styles.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../utills/email_validator.dart';
import '../../../../utills/show_scaled_dialog.dart';
import '../../../shared/error_dialog.dart';
import '../../../shared/shrink_property.dart';
import '../../../shared/text_input.dart';
import '../../../shared/background.dart';
import 'bloc/login_bloc.dart';

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
      child: BlocProvider(
        create: (context) => LoginBloc(
          context.read<AuthRepository>(),
          context.read<StorageRepository>(),
        ),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                context.read<AppBloc>().add(const AppEvent.loadingComplete());
                context.read<AccountBloc>().add(const AccountEvent.started());
                context.go('/dashboard');
              },
              error: (e) {
                context.read<AppBloc>().add(const AppEvent.loadingComplete());
                showScaleDialog(
                  context,
                  ErrorDialog(
                    title: e,
                    action: () => context.pop(),
                    actionText: 'OK',
                  ),
                  null,
                );
              },
            );
          },
          child: WillPopScope(
            onWillPop: () async {
              return context.read<AppBloc>().state == const AppState.loading()
                  ? Future.value(false)
                  : Future.value(true);
            },
            child: Scaffold(
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
          ),
        ),
      ),
    );
  }
}

class LoginContent extends StatefulWidget {
  LoginContent({super.key, required this.prevRoute});
  String prevRoute;

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
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
                    disableInput: context.watch<AppBloc>().state ==
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
                    disableInput: context.watch<AppBloc>().state ==
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
                                context.read<LoginBloc>().add(
                                      LoginEvent.login(
                                        _emailCtrl.text,
                                        _passwordCtrl.text,
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
                                'Masuk',
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun? ',
                          style: Styles.font.base,
                        ),
                        InkWell(
                          onTap: () {
                            if (context.read<AppBloc>().state ==
                                const AppState.loading()) {
                            } else if (widget.prevRoute == 'register') {
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
                    ),
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
