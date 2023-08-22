import 'package:e_foodies/src/features/auth/data/auth_repository.dart';
import 'package:e_foodies/src/core/data/storage/storage_repository.dart';
import 'package:e_foodies/src/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/account/account_bloc.dart';
import 'core/bloc/app/app_bloc.dart';
import 'features/account/data/account_repository.dart';
import 'features/dashboard/data/dashboard_repository.dart';
import 'features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'features/store/data/store_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => StorageRepository(),
        ),
        RepositoryProvider(
          create: (context) => StoreRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AppBloc(storageRepository: context.read<StorageRepository>())
                  ..add(
                    const AppEvent.started(),
                  ),
          ),
          BlocProvider(
            create: (context) => AccountBloc(
              accountRepository: AccountRepository(),
              authRepository: context.read<AuthRepository>(),
              storageRepository: context.read<StorageRepository>(),
            )..add(const AccountEvent.started()),
          ),
          BlocProvider(
            create: (context) => DashboardBloc(
              authRepository: context.read<AuthRepository>(),
              storageRepository: context.read<StorageRepository>(),
              dashboardRepository: DashboardRepository(),
            ),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          builder: (context, child) => MaterialApp.router(
            title: 'e-foodies',
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
                alwaysUse24HourFormat: true,
              ),
              child: child!,
            ),
          ),
        ),
      ),
    );
  }
}
