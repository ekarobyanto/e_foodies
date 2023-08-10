import 'package:e_foodies/src/constants/styles.dart';
import 'package:e_foodies/src/features/auth/data/auth_repository.dart';
import 'package:e_foodies/src/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:e_foodies/src/features/shared/success_dialog.dart';
import 'package:e_foodies/src/utills/show_scaled_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/bloc/app_bloc.dart';

import '../../../shared/background.dart';
import '../../../shared/error_dialog.dart';
import 'widgets/register_content.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key, required this.prevRoute});

  String prevRoute;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocProvider(
        create: (context) => RegisterBloc(
          authRepository: context.read<AuthRepository>(),
        ),
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (error) {
                context.read<AppBloc>().add(const AppEvent.loadingComplete());
                showScaleDialog(
                  context,
                  ErrorDialog(
                    title: error,
                    action: () => context.pop(),
                    actionText: 'OK',
                  ),
                  null,
                );
              },
              success: () {
                context.read<AppBloc>().add(const AppEvent.loadingComplete());
                showScaleDialog(
                  context,
                  SuccessDialog(
                    title: 'Registrasi Berhasil',
                    action: () {
                      context.pop();
                      if (widget.prevRoute == 'login') {
                        context.pop();
                      } else {
                        context.push('/login', extra: 'register');
                      }
                    },
                    actionText: 'OK',
                  ),
                  null,
                );
              },
            );
          },
          child: WillPopScope(
            onWillPop: () {
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
                  child: RegisterContent(
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
