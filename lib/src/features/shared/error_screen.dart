import 'package:e_foodies/src/core/bloc/app/app_bloc.dart';
import 'package:e_foodies/src/core/data/storage/storage_repository.dart';
import 'package:e_foodies/src/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../constants/styles.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen(
      {super.key,
      required this.error,
      required this.onRetry,
      this.enableSignOut});

  final String error;
  final VoidCallback onRetry;
  bool? enableSignOut;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            error,
            style: Styles.font.bxl,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: onRetry,
            child: Icon(
              Icons.restart_alt_outlined,
              color: Styles.color.primary,
              size: 100,
            ),
          ),
          InkWell(
            onTap: () {
              context.read<AppBloc>().add(const AppEvent.signOut());
              router.go('/welcome');
            },
            child: Text(
              'Keluar',
              style: Styles.font.bxl.copyWith(color: Styles.color.danger),
            ),
          ),
        ],
      ),
    );
  }
}
